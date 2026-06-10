package Nodes;
import t "../Types"
import rl "vendor:raylib";

Sprite2DConstructor::proc(parent: ^t.Nest, name: string, nestType: t.NestTypes, texture: ^rl.Texture) -> ^t.Sprite2D {
    newSprite2D := new(t.Sprite2D);
    newSprite2D.Name = name;
    newSprite2D.NestType = nestType;
    newSprite2D.texture = texture;
    newSprite2D.VTabel = SPRITE2D_NEST_VT;
    newSprite2D.SpriteVT = SPRITE2D_VT;
    
    if Sprite2DParentCaster(parent) && parent != nil {
        parentCast := (^t.Sprite2D)(parent);
        newSprite2D.global_position = parentCast.global_position;
        newSprite2D.Parent = parent;
    } else {
        newSprite2D.global_position.x = 0.0;
        newSprite2D.global_position.y = 0.0;
    }
    return newSprite2D;
};

Sprite2DParentCaster::proc(parent: ^t.Nest) -> bool {
    if  parent.NestType == .Sprite2D ||
        parent.NestType == .Nest2D 
        { return true; }
    return false;
}

SPRITE2D_NEST_VT := t.NestTabel{
    Ready = proc(self: ^t.Nest) {},
    Process = proc(self: ^t.Nest, delta: f32) {
        s := (^t.Sprite2D)(self);
        s.SpriteVT.Update(s, delta);
    },
    PhysicProcess = proc(self: ^t.Nest, delta: f32) {},
    Draw = proc(self: ^t.Nest) {
        s := (^t.Sprite2D)(self);
        s.SpriteVT.Draw(s, 0);
    },
};

SPRITE2D_VT := t.Sprite2DVTabel{
    Update = proc(self: ^t.Sprite2D, delta: f32) {

    },
    Draw = proc(self: ^t.Sprite2D, delta: f32) {
        rl.DrawTextureV(self.texture^, self.global_position, rl.WHITE)
    },
}