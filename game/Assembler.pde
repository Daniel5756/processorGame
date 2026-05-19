import java.util.Scanner;
class Assembler {
  /*
  add %r1, %r2
  
  */
  //%r indicates register
  //()  is a pointer
  public Register[] assemble(String pgm) {
    Scanner sc = new Scanner(pgm);
    while(sc.hasNextLine()) {
      String[] line = sc.nextLine().split(" ");
      String instr = line[0];
    }
    return null;
  }  
}
