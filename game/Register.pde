class Register {
  private int value;
  private int bit;
  public Register() {
    bit = -1; value = 0;
  }
  public Register(int bit) {
    this.bit = bit; value = 0;
  }
  public int get() {return value;}
  public void set(int value) {this.value = value%(1 << bit);}
  public int get(int idx) {return ((1 << idx) & value) >> idx;} //get specific bit
  
}
