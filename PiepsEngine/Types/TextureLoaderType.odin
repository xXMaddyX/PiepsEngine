package Types;
import rl "vendor:raylib"

TextureLoaderVTabel::struct{
    LoadTexture:            proc(self: ^TextureLoader, path: cstring, name: string),
    DeleteTexture:          proc(self: ^TextureLoader, textureToDelete: string),
}

TextureLoader::struct{
    Textures:               map[string]^rl.Texture,
    loaderVTabel:           ^TextureLoaderVTabel,
}