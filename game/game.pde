Processor proc;
boolean done;
void setup() {
  //String[] program = loadStrings("http://homer.stuy.edu/~dberkovich70/dinosaur.txt");
  size(512,512);
  String[] program = {
    "mov 0 $255",
    "mov 1000, $255",
    "mov 1001, $255",
    "mov 1002, $255",
    "mov 1003, $255",
    "mov 1004, $255",
    "mov 1005, $255",
    "mov 1006, $255",
    "end 0"
  };
  frameRate=4;
  proc = new Processor(program);
  done = false;
} 
public void run() {
  //if(proc.getInstr()[proc.getPlace()][0] == null) {done = true;}
  if (proc.getInstr()[proc.getPlace()][0].get() == 11) {done = true;}
  if (!done) {
    proc.step();
    proc.heap.render(0,0);
    print("beep");
    proc.stack.render(0, (256+128));
    proc.screen.render(256,0);
    proc.sprites.render(256,128);
  }
}
