package Nodes;
import rl "vendor:raylib";

Nest2D::struct{
    using base:             Nest,
    global_position:        rl.Vector2,
};

Nest2DConstructor::proc(parent: ^Nest, name: string, nestType: NestTypes) -> ^Nest2D {
    newNest2D := new(Nest2D);
    if Nest2DParentCaster(parent) && parent != nil {
        parentCast := (^Nest2D)(parent);
        newNest2D.global_position = parentCast.global_position
        newNest2D.Parent = parent;
    } else { newNest2D.global_position = rl.Vector2{} }
    newNest2D.global_position.x = 0.0;
    newNest2D.global_position.y = 0.0;
    newNest2D.Name = name;
    newNest2D.NestType = nestType;
    newNest2D.VTabel = NEST_VTABEL;
    return newNest2D;
};


Nest2DParentCaster::proc(parent: ^Nest) -> bool {
    if  parent.NestType == .Nest2D || 
        parent.NestType == .Sprite2D
    { return true };
    return false;
}