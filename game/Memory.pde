class Memory {
  
  Register[] mem;
  int start, len;
  public Memory(Register[] m, int s, int l) {
    start = s; len = l; mem = m;
  }
  public Register get(int index) {if (index >= len) {print("segfault");}return mem[start+index];}
  public void set(Register r, int i) {if (i >= len) {print("segfault");}mem[i+start] = r;}
  public int getStart() {return start;}
  public int getLength() {return len;}
  public void display(int x, int y) {
    //implement later
  }
  
}
