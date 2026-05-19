class MemoryGroup extends Memory {
  int aIndex;
  ArrayList<Memory> ram;
  public MemoryGroup(int len) {
    super(new Register[len], 0, len);
    ram = new ArrayList<Memory>();
  }
  public Memory malloc(int len) {
    int out = aIndex;
    aIndex+=len;
    ram.add(new Memory(super.mem, out, len));
    if (aIndex >= super.len) {
      println("Not enough memory");
      return null;
    }
    return ram.get(ram.size()-1);
  }
  public void free(Memory mem) {
    ram.remove(mem);
  }
  public ArrayList<Memory> getAllocations () {return ram;}
}
