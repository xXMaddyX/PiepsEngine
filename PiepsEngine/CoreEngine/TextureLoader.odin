package CoreEngine;
import rl "vendor:raylib";

TextureLoader::struct{
    Textures:               map[string]^rl.Texture
}

TextureLoader_Init::proc() -> ^TextureLoader {
    tl := new(TextureLoader);
    return tl;
}

TextureLoader_Load_Texture::proc(tl: ^TextureLoader, path: cstring, name: string) {
    newTexture := new(rl.Texture);
    newTexture^ = rl.LoadTexture(path);
    tl.Textures[name] = newTexture;
}

TextureLoader_Load_Texture2D::proc(tl: ^TextureLoader, path: cstring, name: string) {

}