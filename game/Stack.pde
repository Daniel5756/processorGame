class Stack extends Memory {
  int index;
  public Stack(Register[] mem, int start, int len) {
    super(mem, start, len);
    index = 0;
  }
  public void push(Register r) {
    
    if (index >= len) {
      index-=len;
    }
    mem[index+start] = r.copy();
    index++;
  }
  public Register pop() {
    
    if (index < 0) {
      index+=len;
    }
    Register r =  mem[index+start].copy();
    index--;
    return r;
  }
  
}
