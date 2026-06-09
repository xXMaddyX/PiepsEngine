package CoreEngine;
import rl "vendor:raylib";

TextureLoaderVTabel::struct{
    loadTexture: proc(self: ^TextureLoader, path: cstring, name: string),

}

TextureLoader::struct{
    Textures:               map[string]^rl.Texture,
    loaderVTabel:           ^TextureLoaderVTabel,
}

TextureLoader_Init::proc() {
    newTextureLoader := new(TextureLoader);
    newTextureLoader.loaderVTabel = &TEXTURE_LOADER_VT;
    ctx.textureLoader = newTextureLoader;
}

TextureLoader_Load_Texture::proc(self: ^TextureLoader, path: cstring, name: string) {
    newTexture := new(rl.Texture);
    newTexture^ = rl.LoadTexture(path);
    self.Textures[name] = newTexture;
}

TextureLoader_Delete_Texture::proc(self: ^TextureLoader, textureToDelete: string) {
    rl.UnloadTexture(self.Textures[textureToDelete]^);
}

TEXTURE_LOADER_VT := TextureLoaderVTabel{
    loadTexture = TextureLoader_Load_Texture,
};