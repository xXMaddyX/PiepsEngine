package CoreEngine;
import t "../Types"
import "core:fmt"

SceneManager_Init::proc() -> ^t.SceneManager {
    newSceneManager := new(t.SceneManager);
    newSceneManager.VTabel = &SCENEMANAGER_VT;
    return newSceneManager;
};

SCENEMANAGER_VT := t.SceneManagerVTabel{
    SetStartScene = proc(self: ^t.SceneManager, sceneToStart: string) {
        self.current_scene = self.SceneMap[sceneToStart];
    },
    AddScene = proc(self: ^t.SceneManager, sceneToAdd: ^t.Scene) {
        self.SceneMap[sceneToAdd.Name] = sceneToAdd;
    },
    Update = proc(self: ^t.SceneManager, delta: f32) {
        if self.current_scene == nil { return };
        self.current_scene.VTabel.Update(self.current_scene, delta);
    },
    PhysicsUpdate = proc(self: ^t.SceneManager, delta: f32) {
        if self.current_scene == nil { return };
        self.current_scene.VTabel.PhysicsUpdate(self.current_scene, delta);
    },
};