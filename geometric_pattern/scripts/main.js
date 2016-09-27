var NUM_CIRCLES = 12;
var circleDiameter;

function setup() {
    createCanvas(480, 600);
    circleDiameter = width/NUM_CIRCLES
}

function draw() {
    // Change this so instead of width, height it finds the nearest multiple of .75 or something
    
    /*
    for (var w = 0; w < width; w+=.75)
    {
        for (var h = 0; h < height; h+=.75){
            console.log("" + w + h);
            ellipse(i*circleDiameter,h*circleDiameter,circleDiameter,circleDiameter);
        }
    }
    */
}
