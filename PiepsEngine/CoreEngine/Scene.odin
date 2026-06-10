package CoreEngine;
import t "../Types"
import type "../Types"

SceneConstructor::proc(name: string, rootNode: ^type.Nest) -> ^t.Scene {
    newScene := new(type.Scene);
    newScene.Name = name;
    newScene.RootNode = rootNode;
    newScene.VTabel = SCENE_VT;
    return newScene;
}

SCENE_VT := t.SceneVTabel{
    Update = proc(self: ^type.Scene, delta: f32) {
        if self.RootNode != nil {
            self.RootNode.VTabel.Process(self.RootNode, delta);
            self.RootNode.VTabel.Draw(self.RootNode)
        }
    },
    PhysicsUpdate = proc(self: ^type.Scene, delta: f32) {
        self.RootNode.VTabel.PhysicProcess(self.RootNode, delta);
    }
}