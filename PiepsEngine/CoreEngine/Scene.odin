package CoreEngine;
import nodes "../Nodes"

SceneVTabel::struct{
    Update:                 proc(self: ^Scene, delta: f32),
    PhysicsUpdate:          proc(self: ^Scene, delta: f32),
}

Scene::struct{
    Name:                   string,
    RootNode:               ^nodes.Nest,
    VTabel:                 SceneVTabel,
}

SceneConstructor::proc(name: string, rootNode: ^nodes.Nest) -> ^Scene {
    newScene := new(Scene);
    newScene.Name = name;
    newScene.RootNode = rootNode;
    newScene.VTabel = SCENE_VT;
    return newScene;
}

SCENE_VT := SceneVTabel{
    Update = proc(self: ^Scene, delta: f32) {
        if self.RootNode != nil {
            self.RootNode.VTabel.Process(self.RootNode, delta);
            self.RootNode.VTabel.Draw(self.RootNode)
        }
    },
    PhysicsUpdate = proc(self: ^Scene, delta: f32) {
        self.RootNode.VTabel.PhysicProcess(self.RootNode, delta);
    }
}