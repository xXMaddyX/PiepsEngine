package CoreEngine;

NestTypes::enum{
    Nest,
    Nest2D,
    Sprite2D,
}

NestTabel::struct{
    Ready: proc(self: ^Nest),
    Update: proc(self: ^Nest),
    Process: proc(self: ^Nest, d: i32),
    PhysicProcess: proc(self: ^Nest, d: i32),
    Draw: proc(self: ^Nest),
}

Nest::struct{
    NestType: NestTypes,
    Name: string,
    Is_Ready: bool,
    Parent: ^Nest,
    Childs: [dynamic]^Nest,
    VTabel: ^NestTabel
}

NestConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes) -> ^Nest {
    newNest := new(Nest);
    newNest.Name = name;
    newNest.Parent = parent;
    newNest.NestType = nestType;
    newNest.VTabel = &NEST_VTABEL;
    return newNest;
};

NEST_VTABEL := NestTabel{
    Ready = proc(self: ^Nest) {},
    Update = proc(self: ^Nest) {},
    Draw = proc(self: ^Nest) {},
    Process = proc(self: ^Nest, delta: i32) {},
    PhysicProcess = proc(self: ^Nest, delta: i32) {},
    
};
