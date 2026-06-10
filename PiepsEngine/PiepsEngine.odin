package PiepsEngine;
import rl "vendor:raylib";
import cs "CoreEngine";
import "core:fmt"


PiepsEngine_Create::proc() {
    cs.SceneManager_Init()
    cs.TextureLoader_Init();
    fmt.printf("PIEPS_ENGINE: Context Created\n")
};

PiepsEngine_Create_Window::proc(
    screenWidth: i32, 
    screenHeight: i32, 
    gameName: cstring, 
    targetFTP: i32
) {
    cs.Window_Init(screenWidth, screenHeight, gameName, targetFTP);
    cs.ctx.window.VTabel.WindowStart(cs.ctx.window);
    fmt.printf("PIEPS_ENGINE: Window Created\n")
};

PiepsEngine_Run::proc() {
    fmt.printf("PIEPS_ENGINE: START\n")
    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime();
        
        rl.BeginDrawing();
        rl.ClearBackground(rl.BLACK);
        cs.ctx.sceneManager.VTabel.Update(cs.ctx.sceneManager, dt);
        rl.EndDrawing();
    }
};