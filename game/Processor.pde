class Processor {
  public Display screen;
  public Display sprites;
  public Memory heap;
  public MemoryGroup mem;
  public Stack stack;
  public Register[] ram;
  
  private Register[][] instr;
  private int currentPart;
  public Register[][] getInstr() {return instr;}
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
  */
  public Processor(String[] instructions) {
    ram = new Register[1<<19]; //<- big number: 256x512 heap+stack, 3*256x256 sprites, 3*256*256 display: 4 MB ram needed...\
    for (int i = 0; i < ram.length; i++) {
      ram[i] = new Register();
    }
    mem = new MemoryGroup(ram);
    
    heap = mem.allocate((128+256)*512);
    stack = mem.allocateStack(2);//56*128);
    screen = mem.allocateDisplay(3);//*256*256);
    sprites = mem.allocateDisplay(3);//*256*256);
    
    instr = new Assembler().assemble(instructions);
  }
  public void step() {
    Register[] instruction = instr[currentPart];
    if (instruction[0].get() < 8) {
      if (instruction[3] != null) {
        mem.get(instruction[1].get()).registerOperation(instruction[3].get(), instruction[0].get());
      }
      else if (instruction[2] != null) {
        mem.get(instruction[1].get()).registerOperation(mem.get(instruction[2].get()), instruction[0].get());
      }
    }
    if (instruction[0].get() == 8) {stack.push(mem.get(instruction[1].get()));}
    if (instruction[0].get() == 9) {mem.set(stack.pop(), instruction[1].get());}
    if (instruction[0].get() == 10) {
      if (mem.get(instruction[1].get()).get() == 1) {                                //SPAGHETTI!!!!!!!!
        currentPart = instruction[3].get(); return;
      }
    }
    currentPart++;
  }
}
