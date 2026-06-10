package Types;

SceneManagerVTabel::struct{
    SetStartScene:          proc(self: ^SceneManager, sceneToStart: string),
    AddScene:               proc(self: ^SceneManager, sceneToAdd: ^Scene),
    Update:                 proc(self: ^SceneManager, delta: f32),
    PhysicsUpdate:          proc(self: ^SceneManager, delta: f32),
};

SceneManager::struct{
    SceneMap:               map[string]^Scene,
    current_scene:          ^Scene,
    VTabel:                 ^SceneManagerVTabel,
};