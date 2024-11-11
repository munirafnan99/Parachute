//center coordinates of the circle
float cntX;
float cntY;

//dimensions of the rectangle
float basketLength;
float basketHeight;

final float MAX_SIZE = 400; //maximum size of the balloon
final float BASKET_SIZE = 100; //maximum size of the basket

//reference point used for the lines
float lineReferenceY; 
float lineReferenceY_2;

//diameter of the balloon
float sizeH;
float sizeV;

final float N = 40; //the balloon moves 1/N-th of the way to the mouse position each frame

//x and y coordinate
float X;
float Y;

void setup() {
  size(800, 500);
  //sizeH = 4*width/5;
  //sizeV = 4*height/5;
  //basketLength = 3*sizeH/100;
  //basketHeight = 3*sizeV/100;
  cntX = -100;
  cntY = -200;
}

void draw() {
  drawObject();
  moveObject();
}

void moveObject() {

  cntX = cntX + (X - cntX) / N ;
  cntY = cntY + (Y - cntY) / N ;

  sizeH = (MAX_SIZE*cntY)/height;
  sizeV = (MAX_SIZE*cntY)/height;
  basketLength = (BASKET_SIZE*cntY)/height;
  basketHeight = (BASKET_SIZE*cntY)/height;
}

void drawObject() {
  background(#3DE1F2);

  //the balloon
  fill(random(255), 100, 200); //random colours
  stroke(0); //black border
  strokeWeight(3);
  ellipse(cntX, cntY, sizeH, sizeV); //1st circle
  fill(random(255), 100, 200);
  ellipse(cntX, cntY, sizeH/1.5, sizeV); //2nd circle
  fill(random(255), 100, 200);
  ellipse(cntX, cntY, sizeH/3, sizeV); //3rd circle
  fill(random(255), 100, 200);
  ellipse(cntX, cntY, sizeH/5, sizeV); //4th circle

  //reference points for construction of the lines
  lineReferenceY = cntY + sizeV/2 + sizeV/8; 
  lineReferenceY_2 = cntY +sizeV/2; 

  //basket
  fill(#832541); //brown basket colour
  rect(cntX - basketLength/2, lineReferenceY, basketLength, basketHeight);


  //the strings attached
  line(cntX - basketLength/2, lineReferenceY, cntX - basketLength/2, lineReferenceY_2); //left string
  line(cntX + basketLength/2, lineReferenceY, cntX + basketLength/2, lineReferenceY_2); //right string
}

void mouseClicked() {
 X = mouseX;
 Y = mouseY;
}
