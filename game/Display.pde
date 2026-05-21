class Display extends Memory {
  
  public Display(Register[] m, int s, int l) {
    super(m, s, l);
  }
  public void render(int x, int y) {
    for (int i = start; i < len+start; i++) {
      int r = mem[i].get();
      int b = mem[i+1].get();
      int g = mem[i+2].get();
      stroke(r,b,g);
      point(x+(i/3)%256, y+(i/3)/256);
    }
  }
}
