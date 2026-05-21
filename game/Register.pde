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
  public Register registerOperation(int other, int op) {
    Register r = new Register(this.bit);
    r.set(other);
    return registerOperation(r, op);
  }
  public Register registerOperation(Register other, int op) {
    Register out = new Register(max(this.bit, other.getBit()));
    switch (op) {
      case 0: //add
        out.set(get()+other.get()); break;
      case 1: //sub
        out.set(get()-other.get()); break;
      case 2: //mul
        out.set(get()*other.get()); break;
      case 3: //div
        out.set(get()/other.get()); break;
      case 4: //pow
        out.set(int(pow(get(),other.get()))); break;
      case 5: //bitshiftL
        out.set(get()<<other.get()); break;
      case 6: //comparison to other: if more: 1, equal: 0, less: -1
        if (get() == other.get()) {out.set(0);}
        else if (get() > other.get()) {out.set(1);}
        else {out.set(-1);}
        break;
    }
    return out;
  }
}
