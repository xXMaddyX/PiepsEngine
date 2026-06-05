package Nodes;
import rl "vendor:raylib";

Sprite2D::struct{
    using base:         Nest,
    global_positon:     rl.Vector2,
    layer:              f32,
    texture:            rl.Texture,
}