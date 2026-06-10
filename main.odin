package main;
import PiepsEngine "PiepsEngine"
import core "PiepsEngine/CoreEngine"
import ctx "PiepsEngine/Context"
import nodes "PiepsEngine/Nodes"
import "core:fmt"

main::proc() {
    PiepsEngine.PiepsEngine_Create();
    PiepsEngine.PiepsEngine_Create_Window(640, 480, "TestGame", 60);
    CreateGame();
    PiepsEngine.PiepsEngine_Run();
}

CreateGame::proc() {
    ctx.ctx.textureLoader.loaderVTabel.LoadTexture(ctx.ctx.textureLoader, "./Game/chilli.png", "Chilli");

    newRootNode := nodes.NestConstructor(nil, "ROOT", nodes.NestTypes.Nest2D);
    newRootNode.Name = "ROOT";

    newSprite2D := nodes.Sprite2DConstructor(newRootNode, "Chilli", nodes.NestTypes.Sprite2D, ctx.ctx.textureLoader.Textures["Chilli"]);
    append(&newRootNode.Childs, (^nodes.Nest)(newSprite2D));

    newScene := core.SceneConstructor("MainScene", newRootNode);
    ctx.ctx.sceneManager.VTabel.AddScene(ctx.ctx.sceneManager, newScene);
    ctx.ctx.sceneManager.current_scene = ctx.ctx.sceneManager.SceneMap["MainScene"];
}