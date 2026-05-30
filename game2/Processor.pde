class Processor {
  public Stack stack;
  public color[] ram;
  
  private int[][] instr;
  private int currentPart;
  public color[][] getInstr() {return instr;}
  public int getPlace() {return currentPart;}
  
  /*
  0: add 3, $4
  1: sub
  2: mul
  3: div
  4: pow
  5: shl << (double)
  6: comp 4
  7: mov 4<-5

  8: psh
  9: pop
  10: jmp ptr amt
  11: end
  12: cll
  13: ret
  */
  public Processor(String[] instructions) {
    instr = new Assembler().assemble(instructions);
    stack = new Stack(ram, 640, 128);
  }
  public void step(color[] ram) {
    
    stack.setMem(ram);
    int[] instruction = instr[currentPart];
    int op2 = instruction[3];
    if (instruction[2] != -1) {op2 = ram[instruction[2]];}
    switch (instruction[0]) {
      case 0: ram[instruction[1]] += op2;break;                                    //add
      case 1: ram[instruction[1]] -= op2;break;                                    //sub
      case 2: ram[instruction[1]] *= op2;break;                                    //mul
      case 3: ram[instruction[1]] /= op2;break;                                    //div
      case 4: ram[instruction[1]] = color(pow(ram[instruction[1]],op2));break;  //pow
      case 5: ram[instruction[1]] = ram[instruction[1]] << op2;break;           //shl
      case 6:                                                                         //comp
        int out = 0;
        if (ram[instruction[1]] > 0) {out = 1;} 
        if (ram[instruction[1]] < 0) {out = -1;}
        ram[instruction[1]] = out;
        break;
      case 7: ram[instruction[1]] = op2;break;                                     //mov
      case 8: stack.push(ram[instruction[1]]);break;                               //psh
      case 9: ram[instruction[1]] = stack.pop();break;                             //pop
      case 10:                                                                        //jmp
        if (ram[instruction[1]] == 1) {currentPart = op2-1;} break;
      case 11: currentPart = instr.length;break;                                      //end  
      case 12:                                                                        //cll
        stack.push(currentPart);
        if (instruction[1] < 0) {currentPart = op2-1;} else {
        currentPart = ram[instruction[1]];} break;
      case 13: currentPart = stack.pop();break;                                      //ret
      case 14: ram[ram[instruction[1]]] = op2; break;                          //mea moves to the place that the thing points to... like a 2d mov
      case 15:
        int rx = ram[instruction[1]];
        int ry = ram[instruction[1] + 1];
        int rw = ram[instruction[1] + 2];
        int rh = ram[instruction[1] + 3];
        color rc = ram[instruction[1] + 4];
      
        for (int yy = ry; yy < ry + rh; yy++) {
          if (yy < 0 || yy >= height) continue;
      
          int rowBase = yy * width;
          for (int xx = rx; xx < rx + rw; xx++) {
            if (xx < 0 || xx >= width) continue;
            ram[rowBase + xx] = rc;
          }
        }
        break;
      case 16: updatePixels(); break;
    }
  
    currentPart++;
  }
}
