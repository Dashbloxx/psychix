#include <errno.h>
#include <fb.h>
#include <fcntl.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <stddef.h>
#include <stdint.h>
#include <sys/mman.h>
#include <unistd.h>
#include <escp.h>

#define TGA_HEADER_SIZE 18
#define TGA_DATA_OFFSET 18

#define RGBA(r, g, b, a) (((a) << 24) | ((r) << 16) | ((g) << 8) | (b))
#define RGB(r, g, b) RGBA(r, g, b, 255U)

struct fb_info _fb_info;
char * fb;

/*
 *  Convert on-screen coordinates to position in framebuffer.
 */
unsigned int genbufferpos(int x, int y) {
    return x * 4 + y * _fb_info.pitch;
}
void draw_tga(const char *filename, int x, int y, uint8_t *fb, int fb_width) {
    int fd = open(filename, O_RDONLY);
    if (fd == -1) {
        perror("Error opening file");
        return;
    }

    uint8_t header[TGA_HEADER_SIZE];
    if (read(fd, header, TGA_HEADER_SIZE) != TGA_HEADER_SIZE) {
        perror("Error reading TGA header");
        close(fd);
        return;
    }

    int width = header[12] + (header[13] << 8);
    int height = header[14] + (header[15] << 8);
    int bpp = header[16] >> 3;

    if (bpp != 3) {
        printf("Error: only 24-bit RGB TGA files are supported\n");
        close(fd);
        return;
    }

    int image_size = width * height * bpp;
    uint8_t *data = malloc(image_size);

    if (lseek(fd, TGA_DATA_OFFSET, SEEK_SET) == -1) {
        perror("Error seeking to TGA data");
        free(data);
        close(fd);
        return;
    }

    if (read(fd, data, image_size) != image_size) {
        perror("Error reading TGA data");
        free(data);
        close(fd);
        return;
    }

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            int pixel_offset = i * width * bpp + j * bpp;
            int fb_offset = (y + i) * fb_width * 4 + (x + j) * 4;

            fb[fb_offset] = data[pixel_offset + 2];     // Red
            fb[fb_offset + 1] = data[pixel_offset + 1]; // Green
            fb[fb_offset + 2] = data[pixel_offset];     // Blue
            fb[fb_offset + 3] = 0xFF;                   // Alpha
        }
    }

    free(data);
    close(fd);
}

/*
 *  Draw a rectangle.
 */
void paint_rect(int pos_x, int pos_y, int size_x, int size_y, int color) {
    for(int x = pos_x; x <= pos_x + size_x; x++)
    {
        for(int y = pos_y; y <= pos_y + size_y; y++)
        {
            *(fb + genbufferpos(x, y)) = color & 255;
            *(fb + genbufferpos(x, y) + 1) = (color >> 8) & 255;
            *(fb + genbufferpos(x, y) + 2) = (color >> 16) & 255;
        }
    }
}

/*
 *  Draw a panel on screen.
 */
void paint_panel(int pos_x, int pos_y, int size_x, int size_y) {
    paint_rect(pos_x, pos_y, size_x, size_y, RGB(200, 200, 200));
    paint_rect(pos_x + 2, pos_y + 2, size_x + 2, size_y + 2, RGB(255, 255, 255));
}

/*
 *  Draw a window.
 */
void paint_window(int pos_x, int pos_y, int size_x, int size_y) {
    paint_rect(pos_x, pos_y, size_x, size_y, RGB(200, 200, 200));
    paint_rect(pos_x + 2, pos_y + 2, size_x + 2, size_y + 2, RGB(255, 255, 255));
    paint_rect(pos_x + 4, pos_y + 4, size_x - 2, 20, RGB(0, 0, 150));
}

int main() {
    /*
     *  Here we open the framebuffer character device, and get a pointer to the framebuffer. After getting a pointer to the framebuffer, we simply close the
     *  the framebuffer character device, and start using the framebuffer pointer to draw to the framebuffer.
     */
    int fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) {
        if (errno == ENOENT)
            dprintf(STDERR_FILENO, "%serror: %sframebuffer is not available%s\n", F_RED, F_YELLOW, RESET);
        else
            perror("open");
        return EXIT_FAILURE;
    }
    if (ioctl(fd, FBIOGET_INFO, &_fb_info) < 0) {
        perror("ioctl");
        return EXIT_FAILURE;
    }
    fb = mmap(NULL, _fb_info.pitch * _fb_info.height, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (fb == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }
    close(fd);

    /*
     *  Now we can actually use `fb` to draw to the framebuffer and do much more!
     */
    // paint_window(25, 25, 400, 100);

    /*
     *  REMEMBER: to convert a PNG file to a TGA file that the function below supports, use ImageMagick to convert it with the following
     *  command:
     *  1 | convert input.png -depth 8 -type truecolor output.tga
     */
    for(;;) {
        draw_tga("/usr/share/bitmaps/close_up.tga", 5, 5, fb, _fb_info.width);
        draw_tga("/usr/share/bitmaps/close_down.tga", 5, 5, fb, _fb_info.width);
        draw_tga("/usr/share/bitmaps/maximize_up.tga", 5 + 16, 5, fb, _fb_info.width);
        draw_tga("/usr/share/bitmaps/maximize_down.tga", 5 + 16, 5, fb, _fb_info.width);
        draw_tga("/usr/share/bitmaps/minimize_up.tga", 5 + 32, 5, fb, _fb_info.width);
        draw_tga("/usr/share/bitmaps/minimize_down.tga", 5 + 32, 5, fb, _fb_info.width);
    }
    //draw_tga("/usr/share/bitmaps/close.tga", 5, 5, fb, _fb_info.width);

    getchar();
    return EXIT_SUCCESS;
}
