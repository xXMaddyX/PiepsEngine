package Nodes;

NestType::enum { 
    Nest, 
    Nest2D,
    Sprite2D,
}

NestVTable::struct{
    ready:                  proc(self: ^Nest),
    process:                proc(self: ^Nest, delta: i32),
    physics_process:        proc(self: ^Nest, delta: i32),
}

Nest::struct{
    node_type:              NestType,
    Name:                   string,
    parent:                 ^Nest,
    children:               [dynamic]^Nest,
    vtabel:                 ^NestVTable,
}