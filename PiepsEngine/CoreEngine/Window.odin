package CoreEngine;
import rl "vendor:raylib";

WindowVTabel::struct{
    WindowStart: proc(self: ^Window),
}

Window::struct{
    ScreenWidth:            i32,
    ScreenHeight:           i32,
    TargetFPS:              i32,
    GameName:               cstring,
    Is_Running:             bool,
    VTabel:                 ^WindowVTabel,
}

Window_Init::proc(screenWidth: i32, screenHeight: i32, gameName: cstring, targetFTP: i32) -> ^Window {
    w := new(Window);
    w.ScreenWidth = screenWidth;
    w.ScreenHeight = screenHeight;
    w.GameName = gameName;
    w.TargetFPS = targetFTP;
    w.Is_Running = true;
    w.VTabel = &WINDOW_VT;
    return w;
}

WINDOW_VT := WindowVTabel{
    WindowStart = proc(self: ^Window) {
        rl.InitWindow(self.ScreenWidth, self.ScreenHeight, self.GameName);
        if self.ScreenWidth != 0 && self.ScreenHeight != 0 {
            rl.SetWindowSize(self.ScreenWidth, self.ScreenHeight);
        } else {
            self.ScreenWidth = rl.GetMonitorWidth(rl.GetCurrentMonitor()) / 2;
            self.ScreenHeight = rl.GetMonitorHeight(rl.GetCurrentMonitor()) / 2;
            rl.SetWindowSize(self.ScreenWidth, self.ScreenHeight);
        }
        rl.SetTargetFPS(self.TargetFPS);
    },
}