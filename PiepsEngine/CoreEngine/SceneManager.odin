package CoreEngine;

SceneManagerVTabel::struct{
    SetStartScene: proc(self: ^SceneManager, sceneToStart: string),
    AddScene: proc(self: ^SceneManager, sceneToAdd: ^Scene),
    Update: proc(self: ^SceneManager, delta: f32),
    Draw: proc(self: ^SceneManager, delta: f32),
}

SceneManager::struct{
    SceneMap: map[string]^Scene,
    current_scene: ^Scene,
    VTabel: ^SceneManagerVTabel,
}

SceneManager_Init::proc() -> ^SceneManager {
    newSceneManager := new(SceneManager);
    
    return newSceneManager;
}

@private
SetStartScene::proc(self: ^SceneManager, sceneToStart: string) {
    self.current_scene = self.SceneMap[sceneToStart];
}

AddScene::proc(self: ^SceneManager, sceneToAdd: ^Scene) {
    self.SceneMap[sceneToAdd.Name] = sceneToAdd;
}

Update::proc(self: ^SceneManager, delta: f32) {
    if self.current_scene == nil { return };
    
}

Draw::proc(self: ^SceneManager, delta: f32) {
    if self.current_scene == nil { return };
}

SCENEMANAGER_VT := SceneManagerVTabel{
    SetStartScene = SetStartScene,
    AddScene = AddScene,
    Update = Update,
    Draw = Draw,
}