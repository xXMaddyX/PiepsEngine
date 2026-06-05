package CoreEngine;
import Nodes "../Nodes"

SceneVT::struct{
    ready: proc(self: ^Scene),
    process: proc(self: ^Scene, delta: f32),
    physics_process: proc(self: ^Scene, delta: f32),
}

Scene::struct{
    Name:           string,
    Root_node:      ^Nodes.Nest,
    vtabel:        ^SceneVT,
}
