package CoreEngine;
import "core:fmt"

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

SceneManager_Init::proc() -> ^SceneManager {
    newSceneManager := new(SceneManager);
    newSceneManager.VTabel = &SCENEMANAGER_VT;
    return newSceneManager;
};

SCENEMANAGER_VT := SceneManagerVTabel{
    SetStartScene = proc(self: ^SceneManager, sceneToStart: string) {
        self.current_scene = self.SceneMap[sceneToStart];
    },
    AddScene = proc(self: ^SceneManager, sceneToAdd: ^Scene) {
        self.SceneMap[sceneToAdd.Name] = sceneToAdd;
    },
    Update = proc(self: ^SceneManager, delta: f32) {
        if self.current_scene == nil { return };
        self.current_scene.VTabel.Update(self.current_scene, delta);
    },
    PhysicsUpdate = proc(self: ^SceneManager, delta: f32) {
        if self.current_scene == nil { return };
        self.current_scene.VTabel.PhysicsUpdate(self.current_scene, delta);
    },
};