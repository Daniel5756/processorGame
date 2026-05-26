class Register {
  private byte value;
  private byte bit;
  
  public Register() {
    bit = 8; value = 0;
  }
  public Register(byte bit) {
    this.bit = bit; value = 0;
  }
  public byte get() {return value;}
  public void set(byte value) {this.value = (byte) value;}
  
  //public byte get(byte idx) {return ((1 << idx) & value) >> idx;} //get specific bit
  public void render(byte x, byte y) {stroke(value>>(bit-8));point(x,y);}
  
  public byte getSize() {return bit;}
  
  public Register copy() {
    Register r = new Register(bit);
    r.set(value);
    return r;
  }
  
  public byte getBit() {return bit;}
  
  //OPERATIONS WITH OTHER REGISTERS
  public void registerOperation(byte other, byte op) {
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
  
  public void registerOperation(Register other, byte op) {
    //Register out = new Register(max(this.bit, other.getBit()));
    switch (op) {
      case 0: //add
        set((byte) (get()+ other.get())); break;
      case 1: //sub
        set((byte) (get()-other.get())); break;
      case 2: //mul
        set((byte) (get()*other.get())); break;
      case 3: //div
        set((byte) (get()/other.get())); break;
      case 4: //pow
        set(byte(pow(get(),other.get()))); break;
      case 5: //bitshiftL
        set((byte) (get()<<other.get())); break;
      case 6: //comparison to other: if more: 1, equal: 0, less: -1
        if (get() == other.get()) {set((byte) 0);}
        else if (get() > other.get()) {set((byte) 1);}
        else {set((byte) -1);}
        break;
      case 7: set(other.get()); break;
    }
    //return out;
  }
}
