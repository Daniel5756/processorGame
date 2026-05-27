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
  "mov 0 $20000",          // pointer starts at 255
  "mea 0 $FFFF00FF",    // write blue at pixels[pixels[0]]
  "add 0 $1",           // pointer++
  "mov 1 $40000",       // limit
  "sub 1 0",            // [1] = 0x40000 - [0]
  "cmp 1",              // [1] = 1 while still below limit
  "jmp 1 $1",           // loop back to mea
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

  int stepsPerFrame = 50000;

  for (int i = 0; i < stepsPerFrame; i++) {
    if (proc.getPlace() >= proc.getInstr().length) {
      done = true;
      break;
    }
    proc.step(pixels);
  }

  updatePixels();
}
