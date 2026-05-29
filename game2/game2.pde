Processor proc;
int time;
boolean done;
void setup() {
  //String[] program = loadStrings("http://homer.stuy.edu/~dberkovich70/dinosaur.txt");
  size(512,512);
  background(0);
  String[] program1 = {
    "mov 0 $FF",
    "mov 0 $FF",
    "mea 0 $FF0000FF",//2
    "add 0 $1",
    "mov 1 0",
    "sub 1 $FFF",
    "cmp 1",
    "mul 1, $-1",
    "jmp 1 $2",
    "end 0"
  };
String[] program = {
  "mov 2 $20000",          // pointer starts at 255
  "mea 2 $FFFF00FF",    // write blue at pixels[pixels[0]]
  "add 2 $1",           // pointer++
  "mov 3 $30000",       // limit
  "sub 3 2",            // [1] = 0x40000 - [0]
  "cmp 3",              // [1] = 1 while still below limit
  "jmp 3 $1",           // loop back to mea
  "end 0"
};
/*
//[0] and [1] are used for key and rand

sprite copier:
  after each row add 512 to draw 
end function
  display game over
cactus advancer
  cactus.pos++;
cactus maker
  make one...
randomizer
  spit out a random number
key inputer
  lalalala
main loop
  idk
WAIT NO i MIGHT MAKE A RECT AND USE AN AVATAR THINGIE. COPIER IS TOO COMPLEX....
*/
String[] dinoGame = {
  "",
//main
  //set color
  "mov 2 $20000",                //0 pointer starts at 255
  "mea 2 $FFFF00FF",             //1 COLOR
  "add 2 $1",                    //2 pointer++
  "mov 3 $30000",                //3 limit
  "sub 3 2",                     //4 [1] = 0x40000 - [0]
  "cmp 3",                       //5 [1] = 1 while still below limit
  "jmp 3 $1",                    //6 loop back to mea
   
  //height is in 20.
  //cactus x is in 21.
  "add 20 $10",
  "sub 21 $10",
  "sub 0 $77",
  "cmp 0",
  "add 0 $1", //check if its a w
  "jmp 0 $ifW", //if W
  "mov 0 $1",
  "jmp 0 $notW",
  //if w:
  "add 20 $20",
  //notW:
  "push $duck",                   //7 duck
  "push $8", //width
  "push $40", //len
  "mov 2 20", //height in r2
  "shl 2 $8", //*256
  "push 2",
  "call $drawThingie",            //8 spritecopier

  "push $cactus",                   //7 duck
  "push $8", //width
  "push $40", //len
  "mov 2 20", //height in r2
  "add 2 $AFF", //*256
  "push 2",
  "call $drawThingie",            //8 spritecopier
  //check if end
  "mov 2 21",
  "sub 2 $40", //idk man ill figure this out later i dont wanna do this
  
  
//endMain
//spriteCopier
  "pop 2", //coor
  "pop 3", //len
  "pop 4", //width
  "pop 5", //ptr
  
  "mov 6 5",          // pointer starts at 255
  //looper
  "mea 6 $FFFF00FF",    // write blue at pixels[pixels[0]]
  "add 6 $1",           // pointer++
  "mov 7 $30000",       // limit
  "sub 7 6",            // [1] = 0x40000 - [0]
  "cmp 7",              // [1] = 1 while still below limit
  "jmp 7 $looper",           // loop back to mea
  "ret 0",
  
  
  "end 0"
};
  frameRate=60;
  proc = new Processor(program);
  done = false;
  loadPixels();
  time = 0;
} 
void draw() {
  if (done) return;

  int stepsPerFrame = 100000;

  for (int i = 0; i < stepsPerFrame; i++) {
    if (proc.getPlace() >= proc.getInstr().length) {
      done = true;
      break;
    }
    //pixels[1] = int(random(5.0));
    proc.step(pixels);
  }

  updatePixels();
}

void keyPressed() {
  pixels[0] = key;
}
