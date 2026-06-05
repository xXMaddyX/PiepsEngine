package Scenes;
import nodes "../../PiepsEngine/Nodes"
import core "../../PiepsEngine/CoreEngine"

CreateMainScene::proc() {
    mainScene := new(core.Scene);
    mainScene.Name = "MainScene";
    mainScene.Root_node = AddRootNode(mainScene)
}

AddRootNode::proc(scene: ^core.Scene) -> ^nodes.Nest {
    newNest2D := new(nodes.Nest2D);
    return newNest2D
}

AddNodes::proc(scene: ^core.Scene) {
    testNode := new(nodes.Nest2D);
    testNode.parent = scene.Root_node;

    append(&scene.Root_node.children, testNode)
}