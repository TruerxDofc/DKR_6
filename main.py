import pygame as pg

pg.font.init()

WIGHT, HEIGHT = 1366, 720
display = pg.display.set_mode((WIGHT, HEIGHT))

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
ITERATION = 0
SCALE = 300
DELT_POS_X = 0
DELT_POS_Y = 0

FPS = 45
clock = pg.time.Clock()

ITERATION_FONT = pg.font.SysFont('timesnewroman', 20)
TIP_FONT = pg.font.SysFont('timesnewroman', 20)
TITLE_FONT = pg.font.SysFont('timesnewroman', 20)
FPS_FONT = pg.font.SysFont('timesnewroman', 20)


def fractal(ITERATION, x1, x2, y1, y2):
    if ITERATION == 0:
        pg.draw.line(display, WHITE, (x1, y1), (x2, y2))
    else:
        x3 = (x1 + x2) / 2 + (y2 - y1) / 2
        y3 = (y1 + y2) / 2 - (x2 - x1) / 2

        fractal(ITERATION - 1, x1, x3, y1, y3)
        fractal(ITERATION - 1, x3, x2, y3, y2)


def main():
    global ITERATION, SCALE, DELT_POS_X, DELT_POS_Y

    run = 1
    while run:

        clock.tick(FPS)
        for event in pg.event.get():
            if event.type == pg.QUIT:
                run = 0

        iteration_text = ITERATION_FONT.render(
            "iterations: " + str(ITERATION), True, WHITE)
        display.blit(iteration_text, (10, 10))
        tip_text = TIP_FONT.render(
            "if you want to restart press \"R\"", True, WHITE)
        display.blit(tip_text, (10, 30))
        title_text = TITLE_FONT.render(
            "Lévy C curve", True, WHITE)
        display.blit(title_text, (WIGHT / 2, HEIGHT - 30))
        fps_text = FPS_FONT.render(
            f'FPS: {clock.get_fps() :.2f}', True, WHITE)
        display.blit(fps_text, (10, HEIGHT - 30))

        pressed_key = pg.key.get_pressed()
        if pressed_key[pg.K_UP] and ITERATION < 15:
            ITERATION += 1
            pg.time.delay(100)
        if pressed_key[pg.K_DOWN] and ITERATION > 0:
            ITERATION -= 1
            pg.time.delay(100)
        if pressed_key[pg.K_LEFT]:
            SCALE -= 5
        if pressed_key[pg.K_RIGHT]:
            SCALE += 5
        if pressed_key[pg.K_w]:
            DELT_POS_Y -= 5
        if pressed_key[pg.K_s]:
            DELT_POS_Y += 5
        if pressed_key[pg.K_a]:
            DELT_POS_X -= 5
        if pressed_key[pg.K_d]:
            DELT_POS_X += 5
        if pressed_key[pg.K_r]:
            ITERATION = 5
            SCALE = 300
            DELT_POS_X = 0
            DELT_POS_Y = 0

        fractal(ITERATION, (WIGHT / 2) + DELT_POS_X, WIGHT / 2 + SCALE + DELT_POS_X, (HEIGHT / 2) + DELT_POS_Y,
                HEIGHT / 2 + DELT_POS_Y)
        pg.display.set_caption('Levy C curve on pygame')
        pg.display.update()
        display.fill(BLACK)

    pg.quit()


if __name__ == "__main__":
    main()
