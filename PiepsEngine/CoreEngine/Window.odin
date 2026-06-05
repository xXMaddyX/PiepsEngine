package CoreEngine;
import rl "vendor:raylib";

Window::struct{
    ScreenWidth:            i32,
    ScreenHeight:           i32,
    TargetFPS:              i32,
    GameName:               cstring,
    Is_Running:             bool,
}

Window_Init::proc(screenWidth: i32, screenHeight: i32, gameName: cstring, targetFPS: i32,) -> ^Window {
    w := new(Window);
    w.ScreenWidth = screenWidth;
    w.ScreenHeight = screenHeight;
    w.GameName = gameName;
    w.TargetFPS = targetFPS;
    w.Is_Running = true;
    Window_Start(w);
    return w;
}

Window_Start::proc(w: ^Window) {
    rl.InitWindow(640, 480, w.GameName);
    if w.ScreenWidth != 0 && w.ScreenHeight != 0 {
        rl.SetWindowSize(w.ScreenWidth, w.ScreenHeight);
    } else {
        w.ScreenWidth = rl.GetMonitorWidth(rl.GetCurrentMonitor()) / 2;
        w.ScreenHeight = rl.GetMonitorHeight(rl.GetCurrentMonitor()) / 2
        rl.SetWindowSize( w.ScreenWidth, w.ScreenHeight );
    }
    rl.SetTargetFPS(w.TargetFPS);
}