package Types;

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