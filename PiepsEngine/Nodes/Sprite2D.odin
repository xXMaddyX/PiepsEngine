package Nodes;
import rl "vendor:raylib";

Sprite2DVTabel::struct{
    Update: proc(self: ^Sprite2D, delta: f32),
    Draw: proc(self: ^Sprite2D, delta: f32),
}

Sprite2D::struct{
    using base:                 Nest,
    global_position:            rl.Vector2,
    texture:                    ^rl.Texture,
    SpriteVT:                   Sprite2DVTabel,
};

Sprite2DConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes, texture: ^rl.Texture) -> ^Sprite2D {
    newSprite2D := new(Sprite2D);
    newSprite2D.Name = name;
    newSprite2D.NestType = nestType;
    newSprite2D.texture = texture;
    newSprite2D.VTabel = SPRITE2D_NEST_VT;
    newSprite2D.SpriteVT = SPRITE2D_VT;
    
    if Sprite2DParentCaster(parent) && parent != nil {
        parentCast := (^Sprite2D)(parent);
        newSprite2D.global_position = parentCast.global_position;
        newSprite2D.Parent = parent;
    }
    return newSprite2D;
};

Sprite2DParentCaster::proc(parent: ^Nest) -> bool {
    if  parent.NestType == .Sprite2D ||
        parent.NestType == .Nest2D 
        { return true; }
    return false;
}

SPRITE2D_NEST_VT := NestTabel{
    Ready = proc(self: ^Nest) {},
    Process = proc(self: ^Nest, delta: f32) {
        s := (^Sprite2D)(self);
        s.SpriteVT.Update(s, delta);
    },
    PhysicProcess = proc(self: ^Nest, delta: f32) {},
    Draw = proc(self: ^Nest) {
        s := (^Sprite2D)(self);
        s.SpriteVT.Draw(s, 0);
    },
};

SPRITE2D_VT := Sprite2DVTabel{
    Update = proc(self: ^Sprite2D, delta: f32) {

    },
    Draw = proc(self: ^Sprite2D, delta: f32) {
        rl.DrawTextureV(self.texture^, self.global_position, rl.WHITE)
    },
}