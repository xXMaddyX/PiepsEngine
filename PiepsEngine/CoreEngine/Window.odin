package CoreEngine;
import t "../Types"
import rl "vendor:raylib";


Window_Init::proc(screenWidth: i32, screenHeight: i32, gameName: cstring, targetFTP: i32) -> ^t.Window {
    w := new(t.Window);
    w.ScreenWidth = screenWidth;
    w.ScreenHeight = screenHeight;
    w.GameName = gameName;
    w.TargetFPS = targetFTP;
    w.Is_Running = true;
    w.VTabel = &WINDOW_VT;
    return w;
}

WINDOW_VT := t.WindowVTabel{
    WindowStart = proc(self: ^t.Window) {
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