class Memory {
  
  color[] mem;
  int start, len;
  public Memory(color[] m, int s, int l) {
    start = s; len = l; mem = m;
  }
  public void setMem(color[] m) {mem = m;}
  public color[] getMem() {return mem;}
  public color get(int index) {if (index >= len || 0 > index) {throw new RuntimeException("segfault");}return mem[start+index];}
  public void set(color r, int i) {if (i >= len || 0 > i) {throw new RuntimeException("segfault");}mem[i+start] = r;}
  public int getStart() {return start;}
  public int getLength() {return len;}
  
}
