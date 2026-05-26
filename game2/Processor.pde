class Processor {
  public Memory heap;
  public Stack stack;
  public color[] ram;
  
  private color[][] instr;
  private int currentPart;
  public color[][] getInstr() {return instr;}
  public int getPlace() {return currentPart;}
  
  /*
  0: add
  1: sub
  2: mul
  3: div
  4: pow
  5: shl << (double)
  6: comp
  7: mov

  8: psh
  9: pop
  10: jmp
  11: end
  12: cll
  13: ret
  */
  public Processor(String[] instructions) {
    instr = new Assembler().assemble(instructions);
    stack = new Stack(ram, 640, 128);
  }
  public void step() {
    loadPixels();
    int[] instruction = instr[currentPart];
    int op2 = instruction[3];
    if (instruction[2] != -1) {op2 = pixels[instruction[2]];}
    switch (instruction[0]) {
      case 0: pixels[instruction[1]] += op2;break;
      case 1: pixels[instruction[1]] -= op2;break;
      case 2: pixels[instruction[1]] *= op2;break;
      case 3: pixels[instruction[1]] /= op2;break;
      case 4: pixels[instruction[1]] = color(pow(pixels[instruction[1]],op2));break;
      case 5: pixels[instruction[1]] = pixels[instruction[1]] << op2;break;
      case 6: 
        int out = 0;
        if (op2 > 0) {out = 1;} 
        if (op2 < 0) {out = -1;}
        pixels[instruction[1]] = out;
        break;
      case 7: pixels[instruction[1]] = op2;break;
      case 8: stack.push(pixels[instruction[1]]);break;
      case 9: pixels[instruction[1]] = op2;break;
      case 10: pixels[instruction[1]] = op2;break;
      case 11: pixels[instruction[1]] = op2;break;
    }
    updatePixels();
    currentPart++;
  }
}
