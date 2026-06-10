package main;
import PiepsEngine "PiepsEngine"
import core "PiepsEngine/CoreEngine"
import nodes "PiepsEngine/Nodes"

main::proc() {
    PiepsEngine.PiepsEngine_Create();
    PiepsEngine.PiepsEngine_Create_Window(640, 480, "TestGame", 60);
    CreateGame();
    PiepsEngine.PiepsEngine_Run();
}

CreateGame::proc() {
    newScene := new(core.Scene);
    newScene.VTabel = &core.SCENE_VT;

    newRootNode := nodes.NestConstructor(nil, "ROOT", nodes.NestTypes.Nest2D);
    newRootNode.Name = "ROOT";

    newScene.RootNode = newRootNode;
    core.ctx.sceneManager.VTabel.AddScene(core.ctx.sceneManager, newScene);
    core.ctx.sceneManager.current_scene = core.ctx.sceneManager.SceneMap["ROOT"];
}