function playSound() {
    var audioTest = new Audio("https://archive.org/download/testmp3testfile/mpthreetest.mp3");
    audioTest.play();
}

$("#buttonTest").on("click", playSound);