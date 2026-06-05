package main;
import "Game/"
import "PiepsEngine"

main::proc() {
    PiepsEngine.CreateGame(0, 0, 60, "Pieps Test", true);
    Game.MainGameCall();
}