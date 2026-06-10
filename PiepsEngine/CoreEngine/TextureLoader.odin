package CoreEngine;
import t "../Types"
import rl "vendor:raylib";

TextureLoader_Init::proc() -> ^t.TextureLoader {
    newTextureLoader := new(t.TextureLoader);
    newTextureLoader.loaderVTabel = &TEXTURE_LOADER_VT;
    return newTextureLoader;
};

TEXTURE_LOADER_VT := t.TextureLoaderVTabel{
    LoadTexture = proc(self: ^t.TextureLoader, path: cstring, name: string) {
        newTexture := new(rl.Texture);
        newTexture^ = rl.LoadTexture(path);
        self.Textures[name] = newTexture;
    },
    DeleteTexture = proc(self: ^t.TextureLoader, textureToDelete: string) {
        rl.UnloadTexture(self.Textures[textureToDelete]^);
    },
};