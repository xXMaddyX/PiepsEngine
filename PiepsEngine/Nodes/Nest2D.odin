package CoreEngine;

Nest2D::struct{
    using base:             Nest,

};

Nest2DConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes) -> ^Nest2D {
    newNest2D := new(Nest2D);
    newNest2D.Parent = parent;
    newNest2D.Name = name;
    newNest2D.NestType = nestType;
    newNest2D.VTabel = &NEST_VTABEL;
    return newNest2D;
};