var NUM_CIRCLES = 12;
var circleDiameter;
var colorR = 255;
var colorG = 255;
var colorB = 255;

function setup() {
    var cnv = createCanvas(480, 600);
    background(235,114,96);
    fill(color(0,135,203));
    circleDiameter = width/NUM_CIRCLES
    
    //Desired gradiant from (0,135,203) to (152,35,149)
    //Deltas are (152, -100, -54)
    //R, G, B, will change by their net difference/number of circles 
    //This works fine for left - right, up-down, but not for diagonal
    
    
    var y = .5*circleDiameter;
    while (y <= height) {

    var x = .5*circleDiameter;
    while (x <= width) {
        fill(color(colorR,colorG,colorB));
        stroke(color(colorG,colorB,colorR));
        ellipse(x, y, circleDiameter, circleDiameter);
        x += circleDiameter;
        colorR += Math.floor(152/NUM_CIRCLES);
        colorG += Math.floor(-100/NUM_CIRCLES);
        colorB += Math.floor(-54/NUM_CIRCLES);
    }

    y += + .75*circleDiameter;
  }
    
}

function draw() {
    
}