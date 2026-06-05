package PiepsEngine;
import rl "vendor:raylib";
import Core "CoreEngine";

CreateGame::proc(
    screenWidth:            i32,
    screenHeight:           i32,
    targetFPS:              i32,
    gameName:               cstring,
    is_Running:             bool,
) {
    Core.ctx.TextureLoader = Core.TextureLoader_Init();
    Core.ctx.SceneManager = Core.SceneManager_Init();

    Core.ctx.Window = Core.Window_Init(screenWidth, screenHeight, gameName, targetFPS);
    Run();
}

Run::proc() {
    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime();
        Core.SceneManager_Update(Core.ctx.SceneManager, dt);
        
        rl.BeginDrawing();
        rl.ClearBackground(rl.BLACK);
        Core.SceneManager_Draw(Core.ctx.SceneManager, dt);
        rl.EndDrawing();
    };
    //Shutdown()
}