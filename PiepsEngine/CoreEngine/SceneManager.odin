package CoreEngine;

SceneManager::struct{
    SceneMap:           map[string]^Scene,
    current_scene:      ^Scene,
    next_scene:         ^Scene,
}

SceneManager_Init::proc() -> ^SceneManager{
    sm := new(SceneManager);
    return sm;
}

SetStartScene::proc(sm: ^SceneManager, sceneToStart: string) {
    sm.current_scene = sm.SceneMap[sceneToStart];
}

SceneManager_AddScene::proc(sm: ^SceneManager, sceneToAdd: ^Scene) {
    sm.SceneMap[sceneToAdd.Name] = sceneToAdd;
}

SceneManager_Update::proc(sm: ^SceneManager, delta: f32) {
    sm.current_scene.vtabel.process(sm.current_scene, delta);
    sm.current_scene.vtabel.physics_process(sm.current_scene, delta);
    SceneManager_Draw(sm, delta)
}

SceneManager_Draw::proc(sm: ^SceneManager, delta: f32) {
    //HIER DRAWCALL
}