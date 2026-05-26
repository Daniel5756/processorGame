Processor proc;
boolean done;
void setup() {
  //String[] program = loadStrings("http://homer.stuy.edu/~dberkovich70/dinosaur.txt");
  size(512,512);
  String[] program = {
    "mov 0 $255",
    "shl 0, $8",
    "mov 1000, $255",
    "shl 1000, $8",
    "end 0"
  };
  frameRate=4;
  proc = new Processor(program);
  done = false;
} 
public void run() {
  if(proc.getInstr()[proc.getPlace()][0] == null) {done = true;}
  if (proc.getInstr()[proc.getPlace()][0].get() == 11) {done = true;}
  if (!done) {
    proc.step();
    proc.heap.render(0,0);
    proc.stack.render(0, (256+128));
    proc.screen.render(256,0);
    proc.sprites.render(256,128);
  }
}
