class Stack extends Memory {
  int index;
  public Stack(Register[] mem, int start, int len) {
    super(mem, start, len);
    index = 0;
  }
  public void push(Register r) {
    index++;
    if (index >= len) {
      index-=len;
    }
    mem[index+start] = r.copy();
  }
  public Register pop() {
    index--;
    if (index < 0) {
      index+=len;
    }
    return mem[index+start].copy();
  }
  
}
