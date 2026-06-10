package Nodes;
import rl "vendor:raylib";


Sprite2D::struct{
    using base:                 Nest,
    texture:                    rl.Texture,
};

Sprite2DConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes) -> ^Sprite2D {
    newSprite2D := new(Sprite2D);
    newSprite2D.Name = name;
    newSprite2D.NestType = nestType;
    newSprite2D.VTabel = &NEST_VTABEL;
    return newSprite2D;
};