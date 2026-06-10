package Types;
import rl "vendor:raylib"

Sprite2DVTabel::struct{
    Update: proc(self: ^Sprite2D, delta: f32),
    Draw: proc(self: ^Sprite2D, delta: f32),
}

Sprite2D::struct{
    using base:                 Nest,
    global_position:            rl.Vector2,
    texture:                    ^rl.Texture,
    SpriteVT:                   Sprite2DVTabel,
    fields:                     rawptr,
};