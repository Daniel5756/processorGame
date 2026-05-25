class Register {
  private int value;
  private int bit;
  
  public Register() {
    bit = 16; value = 0;
  }
  public Register(int bit) {
    this.bit = bit; value = 0;
  }
  public int get() {return value;}
  public void set(int value) {this.value = value%(1 << bit);}
  
  public int get(int idx) {return ((1 << idx) & value) >> idx;} //get specific bit
  public void render(int x, int y) {stroke(value>>(bit-8));point(x,y);}
  
  public int getSize() {return bit;}
  
  public Register copy() {
    Register r = new Register(bit);
    r.set(value);
    return r;
  }
  
  public int getBit() {return bit;}
  
  //OPERATIONS WITH OTHER REGISTERS
  public void registerOperation(int other, int op) {
    Register r = new Register(this.bit);
    r.set(other);
    registerOperation(r, op);
  }
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
  */
  public void registerOperation(Register other, int op) {
    //Register out = new Register(max(this.bit, other.getBit()));
    switch (op) {
      case 0: //add
        set(get()+other.get()); break;
      case 1: //sub
        set(get()-other.get()); break;
      case 2: //mul
        set(get()*other.get()); break;
      case 3: //div
        set(get()/other.get()); break;
      case 4: //pow
        set(int(pow(get(),other.get()))); break;
      case 5: //bitshiftL
        set(get()<<other.get()); break;
      case 6: //comparison to other: if more: 1, equal: 0, less: -1
        if (get() == other.get()) {set(0);}
        else if (get() > other.get()) {set(1);}
        else {set(-1);}
        break;
      case 7: set(other.get()); break;
    }
    //return out;
  }
}
