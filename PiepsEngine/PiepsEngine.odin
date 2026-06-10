package PiepsEngine;
import rl "vendor:raylib";
import ctx "Context";
import core "CoreEngine"
import "core:fmt"


PiepsEngine_Create::proc() {
    ctx.ctx.sceneManager = core.SceneManager_Init();
    ctx.ctx.textureLoader = core.TextureLoader_Init();
    fmt.printf("PIEPS_ENGINE: Context Created\n")
};

PiepsEngine_Create_Window::proc(
    screenWidth: i32,
    screenHeight: i32,
    gameName: cstring,
    targetFTP: i32
) {
    ctx.ctx.window = core.Window_Init(screenWidth, screenHeight, gameName, targetFTP);
    ctx.ctx.window.VTabel.WindowStart(ctx.ctx.window);
    fmt.printf("PIEPS_ENGINE: Window Created\n")
};

PiepsEngine_Run::proc() {
    fmt.printf("PIEPS_ENGINE: START\n")
    accumulator: f32 = 0;
    PHYSICS_STEP :: f32(1.0 / 60.0);
    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime();
        accumulator += dt;

        for accumulator >= PHYSICS_STEP {
            ctx.ctx.sceneManager.VTabel.PhysicsUpdate(ctx.ctx.sceneManager, PHYSICS_STEP);
            accumulator -= PHYSICS_STEP;
        }
        rl.BeginDrawing();
        rl.ClearBackground(rl.BLACK);
        ctx.ctx.sceneManager.VTabel.Update(ctx.ctx.sceneManager, dt);
        rl.EndDrawing();
    }
};