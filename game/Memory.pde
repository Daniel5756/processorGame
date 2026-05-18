class Memory {
  
  Register[] mem;
  int start, len;
  public Memory(int s, int l, Register[] m) {
    start = s; len = l; mem = m;
  }
  public Register get(int index) {return mem[start+index];}
  public void set(Register r, int i) {mem[i+start] = r;}
}
