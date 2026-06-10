package Nodes;
import rl "vendor:raylib";

Sprite2DVTabel::struct{
    Update: proc(self: ^Sprite2D, delta: f32),
    Draw: proc(self: ^Sprite2D, delta: f32),
}

Sprite2D::struct{
    using base:                 Nest,
    texture:                    ^rl.Texture,
};

Sprite2DConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes, texture: ^rl.Texture) -> ^Sprite2D {
    newSprite2D := new(Sprite2D);
    newSprite2D.Name = name;
    newSprite2D.Parent = parent;
    newSprite2D.NestType = nestType;
    newSprite2D.texture = texture;
    newSprite2D.VTabel = &NEST_VTABEL;
    return newSprite2D;
};

Sprite2D_Update::proc(self: ^Sprite2D, delta: f32) {

}

SPRITE2D_VT := Sprite2DVTabel{
    
}