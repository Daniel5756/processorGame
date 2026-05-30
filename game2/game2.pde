Processor proc;
int time;
boolean done;
void setup() {
  //String[] program = loadStrings("http://homer.stuy.edu/~dberkovich70/dinosaur.txt");
  size(512,512);
  background(0);
String[] program = {
  "mov 2 $20000",          // pointer starts at 255
  "mea 2 $FFFF00FF",    // write blue at pixels[pixels[0]]
  "add 2 $1",           // pointer++
  "mov 3 $30000",       // limit
  "sub 3 2",            // [1] = 0x40000 - [0]
  "cmp 3",              // [1] = 1 while still below limit
  "jmp 3 $1",           // loop back to mea

  
  "mov 2 $20",
  "mov 3 $30",
  "shl 3 $0",
  "mov 4 $2F",
  "mov 5 $2F",
  "mov 6 $FFFFFFFF",
  "rec 2",
  
  "end 0"
};
/*
//[0] and [1] are used for key and rand


*/
String[] dinoGame = {
  "mov 20 $FF",
  "mov 21 $FF",
//main
  //set color
  /*
  "mov 2 $20000",                //0 pointer starts at 255
  "mea 2 $FFFF00FF",             //1 COLOR
  "add 2 $1",                    //2 pointer++
  "mov 3 $40000",                //3 limit
  "sub 3 2",                     //4 [1] = 0x40000 - [0]
  "cmp 3",                       //5 [1] = 1 while still below limit
  "jmp 3 $3",                    //6 loop back to mea
  */
  "mov 2 $0", "mov 3 $FF", "mov 4 $2FF", "mov 5 $FF", "mov 6 $FFFF00FF", "rec 2",
  //height is in 20.
  //cactus x is in 21.
  "add 20 $10",
  "sub 21 $10",
  "mov 2 0",
  "sub 2 $20",
  "cmp 2",
  "add 2 $1", //check if its a w
  "mov 1F .", //jump to ifW
  "add 1F $7",
  "jmp 2 1F", //if W
  "mov 2 $1",
  "mov 1F .",
  "add 1F $4", //jump to notW
  "jmp 2 1F",
  //if w:
  "sub 20 $20",
  //notW:
  //duck:
  "mov 2 $20",
  "mov 3 20",
  "mov 4 $2F",
  "mov 5 $2F",
  "mov 6 $FF0000FF",
  "rec 2",
  //cactus:
  "mov 2 21",
  "mov 3 $180",
  "mov 4 $2F",
  "mov 5 $2F",
  "mov 6 $FF00FFFF",
  "rec 2",  

  //check if end
  "mov 2 21",
  "sub 2 $40", //idk man ill figure this out later i dont wanna do this
  "mov 2 $1",
  "ref 0",
  "jmp 2 $2",
//endMain
  
  "end 0"
};

  frameRate=60;
  proc = new Processor(dinoGame);
  done = false;
  loadPixels();
  time = 0;
} 
void draw() {
  if (done) return;

  int stepsPerFrame = 2;

  for (int i = 0; i < stepsPerFrame; i++) {
    if (proc.getPlace() >= proc.getInstr().length) {
      done = true;
      break;
    }
    //pixels[1] = int(random(5.0));
    proc.step(pixels);
  }

  //updatePixels();
}

void keyPressed() {
  pixels[0] = key;
}
