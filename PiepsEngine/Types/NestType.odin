package Types;

NestTypes::enum{
    Nest,
    Nest2D,
    Sprite2D,
}

NestTabel::struct{
    Ready:              proc(self: ^Nest),
    Process:            proc(self: ^Nest, d: f32),
    PhysicProcess:      proc(self: ^Nest, d: f32),
    Draw:               proc(self: ^Nest),
}

Nest::struct{
    NestType:           NestTypes,
    Name:               string,
    Is_Ready:           bool,
    Parent:             ^Nest,
    Childs:             [dynamic]^Nest,
    VTabel:             NestTabel
}