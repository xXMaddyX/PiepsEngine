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

MyTestFields::struct{
    is_running: bool,
}

myStates := MyTestFields{
    is_running = true,
}

CreateGame::proc() {
    ctx.ctx.textureLoader.loaderVTabel.LoadTexture(ctx.ctx.textureLoader, "./Game/chilli.png", "Chilli");

    newRootNode := nodes.NestConstructor(nil, "ROOT", nodes.NestTypes.Nest2D);
    newRootNode.Name = "ROOT";

    newSprite2D := nodes.Sprite2DConstructor(newRootNode, "Chilli", nodes.NestTypes.Sprite2D, ctx.ctx.textureLoader.Textures["Chilli"]);
    newSprite2D.fields = &myStates;
    newSprite2D.global_position.y = 200;
    append(&newRootNode.Childs, (^nodes.Nest)(newSprite2D));

    newSprite2D.VTabel.PhysicProcess = proc(self: ^nodes.Nest, delta: f32) {
        castSprite := (^nodes.Sprite2D)(self);
        castFields := (^MyTestFields)(castSprite.fields);

        if castSprite.global_position.x  > 600 {
            castFields.is_running = false;
        }
        if castSprite.global_position.x < 50 {
            castFields.is_running = true;
        }

        if castFields.is_running {
            castSprite.global_position.x += 100 * delta
        } else {
            castSprite.global_position.x -= 100 * delta
        } 
    }
    
    newScene := core.SceneConstructor("MainScene", newRootNode);
    ctx.ctx.sceneManager.VTabel.AddScene(ctx.ctx.sceneManager, newScene);
    ctx.ctx.sceneManager.current_scene = ctx.ctx.sceneManager.SceneMap["MainScene"];
}
