package Nodes;
import t "../Types"

NestConstructor::proc(parent: ^t.Nest, name: string, nestType: t.NestTypes) -> ^t.Nest {
    newNest := new(t.Nest);
    newNest.Name = name;
    newNest.Parent = parent;
    newNest.NestType = nestType;
    newNest.VTabel = NEST_VTABEL;
    return newNest;
};

NEST_VTABEL := t.NestTabel{
    Ready = proc(self: ^t.Nest) {},
    Process = proc(self: ^t.Nest, delta: f32) {
        for child in self.Childs {
            child.VTabel.Process(child, delta);
        }
    },
    PhysicProcess = proc(self: ^t.Nest, delta: f32) {
        for child in self.Childs {
            child.VTabel.PhysicProcess(child, delta);
        }
    },
    Draw = proc(self: ^t.Nest) {
        for child in self.Childs {
            child.VTabel.Draw(child);
        }
    },
};
