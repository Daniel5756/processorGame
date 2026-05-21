import java.util.Scanner;
class Assembler {
  /*
  add %r1 %r2
  
  */
  //%r indicates register
  //()  is a pointer
  public Register[] assemble(String pgm) {
    Register[][] out = new Register[3][pgm.split("\n").length];
    Scanner sc = new Scanner(pgm);
    while(sc.hasNextLine()) {
      String[] line = sc.nextLine().split(" ");
      String instr = line[0];
      Register in = new Register();
      Register op1 = new Register();
      Register op2 = new Register();
      if (line[1].charAt(0) == '%') {op1 = int(line[1].substring(2));}
      else if (line[1].charAt(0) == '(') {}
      switch (instr) {
        case "add"
        
      }
    }
    return null;
  }  
}
