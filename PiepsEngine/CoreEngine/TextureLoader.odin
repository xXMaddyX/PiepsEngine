package CoreEngine;
import rl "vendor:raylib";

TextureLoaderVTabel::struct{
    LoadTexture:            proc(self: ^TextureLoader, path: cstring, name: string),
    DeleteTexture:          proc(self: ^TextureLoader, textureToDelete: string),
}

TextureLoader::struct{
    Textures:               map[string]^rl.Texture,
    loaderVTabel:           ^TextureLoaderVTabel,
}

TextureLoader_Init::proc() {
    newTextureLoader := new(TextureLoader);
    newTextureLoader.loaderVTabel = &TEXTURE_LOADER_VT;
    ctx.textureLoader = newTextureLoader;
};

TEXTURE_LOADER_VT := TextureLoaderVTabel{
    LoadTexture = proc(self: ^TextureLoader, path: cstring, name: string) {
        newTexture := new(rl.Texture);
        newTexture^ = rl.LoadTexture(path);
        self.Textures[name] = newTexture;
    },
    DeleteTexture = proc(self: ^TextureLoader, textureToDelete: string) {
        rl.UnloadTexture(self.Textures[textureToDelete]^);
    },
};