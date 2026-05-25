class Display extends Memory {
  
  public Display(Register[] m, int s, int l) {
    super(m, s, l);
  }
  public void render(int x, int y) {
    for (int i = start; i < len+start; i+=3) {
      int r = mem[i].get();
      int g = mem[i+1].get();
      int b = mem[i+2].get();
      stroke(r,g,b);
      point(x+((i-start)/3)%256, y+((i-start)/3)/256);
    }
  }
}
