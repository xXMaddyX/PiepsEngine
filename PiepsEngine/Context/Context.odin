package Context;
import core "../CoreEngine"

CTX::struct{
    window:                 ^core.Window,
    textureLoader:          ^core.TextureLoader,
    sceneManager:           ^core.SceneManager,
}

ctx := CTX{};