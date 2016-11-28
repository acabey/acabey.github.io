function playSound() {
    var audioTest = new Audio("/projects/that_was_easy/assets/OceanMan.mp3");
    audioTest.play();
}

$("#buttonTest").one("click", playSound);