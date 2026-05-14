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
  public void set(int value) {this.value = value%Math.pow(2.0, bit);}
  
}
