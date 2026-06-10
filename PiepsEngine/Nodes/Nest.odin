package Nodes;

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

NestConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes) -> ^Nest {
    newNest := new(Nest);
    newNest.Name = name;
    newNest.Parent = parent;
    newNest.NestType = nestType;
    newNest.VTabel = NEST_VTABEL;
    return newNest;
};

NEST_VTABEL := NestTabel{
    Ready = proc(self: ^Nest) {},
    Process = proc(self: ^Nest, delta: f32) {
        for child in self.Childs {
            child.VTabel.Process(child, delta);
        }
    },
    PhysicProcess = proc(self: ^Nest, delta: f32) {
        for child in self.Childs {
            child.VTabel.PhysicProcess(child, delta);
        }
    },
    Draw = proc(self: ^Nest) {
        for child in self.Childs {
            child.VTabel.Draw(child);
        }
    },
};
