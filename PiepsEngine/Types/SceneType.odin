package Types;

SceneVTabel::struct{
    Update:                 proc(self: ^Scene, delta: f32),
    PhysicsUpdate:          proc(self: ^Scene, delta: f32),
}

Scene::struct{
    Name:                   string,
    RootNode:               ^Nest,
    VTabel:                 SceneVTabel,
}