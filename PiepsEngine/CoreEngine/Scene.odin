package CoreEngine;
import nodes "../Nodes"

SceneVTabel::struct{
    Update:                 proc(self: ^Scene, delta: f32),
    Process:                proc(self: ^Scene, delta: f32),
    PhysicsProcess:         proc(self: ^Scene, delta: f32),
}

Scene::struct{
    Name:                   string,
    RootNode:               ^nodes.Nest,
    VTabel:                 ^SceneVTabel,
}

Scene_Update::proc(self: ^Scene, delta: f32) {
    if self.RootNode != nil {
        self.RootNode.VTabel.Update(self.RootNode);
        self.VTabel.Update(self, delta);
        self.VTabel.PhysicsProcess(self, delta);
    }

}

Scene_Process::proc(self: ^Scene, delta: f32) {
    if self.RootNode != nil {
        for item in self.RootNode.Childs {
            item.VTabel.Process(item, delta);
            item.VTabel.PhysicProcess(item, delta)
        }
    }
}

Scene_PhysicsProcess::proc(self: ^Scene, delta: f32) {

}

SCENE_VT := SceneVTabel{
    Update = Scene_Update,
    Process = Scene_Process,
    PhysicsProcess = Scene_PhysicsProcess,
}