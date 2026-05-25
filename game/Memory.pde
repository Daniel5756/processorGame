class Memory {
  
  Register[] mem;
  int start, len;
  public Memory(Register[] m, int s, int l) {
    start = s; len = l; mem = m;
  }
  public Register[] getMem() {return mem;}
  public Register get(int index) {if (index >= len) {throw new RuntimeException("segfault");}return mem[start+index];}
  public void set(Register r, int i) {if (i >= len) {throw new RuntimeException("segfault");}mem[i+start] = r;}
  public int getStart() {return start;}
  public int getLength() {return len;}
  public void render(int x, int y) {
    for (int i = start; i < len+start; i++) {
      point(x+i%256, y+i/256);
    }
  }
  
}
