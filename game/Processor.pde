class Processor {
  Display screen;
  Display sprites;
  Memory heap;
  MemoryGroup mem;
  Stack s;
  Register[] ram;
  /*
  0: add
  1: sub
  2: mul
  3: div
  4: pow
  5: shl <<
  6: comp
  7: mov
  8: psh
  9: pop
  10: jmp
  */
  public Processor() {
    ram = new Register[int(pow(2, 19))]; //<- big number: 256x512 heap+stack, 3*256x256 sprites, 3*256*256 display: 4 MB ram needed...\
    mem = new MemoryGroup(ram);
    heap = mem
    
  }
  
}
