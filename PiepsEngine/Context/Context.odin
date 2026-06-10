package Context;
import t "../Types"

CTX::struct{
    window:                 ^t.Window,
    textureLoader:          ^t.TextureLoader,
    sceneManager:           ^t.SceneManager,
}

ctx := CTX{};