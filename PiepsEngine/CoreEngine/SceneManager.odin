package CoreEngine;

SceneManagerVTabel::struct{
    SetStartScene:          proc(self: ^SceneManager, sceneToStart: string),
    AddScene:               proc(self: ^SceneManager, sceneToAdd: ^Scene),
    Update:                 proc(self: ^SceneManager, delta: f32),
};

SceneManager::struct{
    SceneMap:               map[string]^Scene,
    current_scene:          ^Scene,
    VTabel:                 ^SceneManagerVTabel,
};

SceneManager_Init::proc() {
    newSceneManager := new(SceneManager);
    newSceneManager.VTabel = &SCENEMANAGER_VT;
    ctx.sceneManager = newSceneManager;
};

SceneManger_SetStartScene::proc(self: ^SceneManager, sceneToStart: string) {
    self.current_scene = self.SceneMap[sceneToStart];
};

SceneManager_AddScene::proc(self: ^SceneManager, sceneToAdd: ^Scene) {
    self.SceneMap[sceneToAdd.Name] = sceneToAdd;
};

SceneManager_Update::proc(self: ^SceneManager, delta: f32) {
    if self.current_scene == nil { return };
    self.current_scene.VTabel.Update(self.current_scene, delta);
};

SCENEMANAGER_VT := SceneManagerVTabel{
    SetStartScene = SceneManger_SetStartScene,
    AddScene = SceneManager_AddScene,
    Update = SceneManager_Update,
};