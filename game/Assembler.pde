import java.util.Scanner;
class Assembler {
  /*
  add %r1 %r2
  
  */
  //%r indicates register
  //()  is a pointer
  public Register[][] assemble(String pgm) {
    Register[][] out = new Register[4][pgm.split("\n").length];
    Scanner sc = new Scanner(pgm);
    int i = 0;
    while(sc.hasNextLine()) {
      String[] line = sc.nextLine().split(" ");
      String instr = line[0];
      Register in = new Register();
      Register op1 = new Register();
      Register op2 = new Register();
      Register op2int = new Register();
      if (line[1].charAt(0) == '%') {op1.set(int(line[1].substring(2)));}
      else if (line[1].charAt(0) == '(') {op1.set(int(line[1].substring(1)));}
      else {op1.set(0);}
      
      if (line[2].charAt(0) == '%') {op2.set(int(line[2].substring(2))); op2int = null;}
      else if (line[2].charAt(0) == '(') {op2.set(int(line[2].substring(1))); op2int = null;}
      else {op2int.set(int(line[2])); op2 = null;}
      /*
      0: add
      1: sub
      2: mul
      3: div
      4: pow
      5: shl <<
      6: cmp
      7: mov    
      8: psh
      9: pop
      */
      switch (instr) {
        case "add": in.set(0); break;
        case "sub": in.set(1); break;
        case "mul": in.set(2); break;
        case "div": in.set(3); break;
        case "pow": in.set(4); break;
        case "shl": in.set(5); break;
        case "cmp": in.set(6); break;
        case "mov": in.set(7); break;
        case "psh": in.set(8); break;
        case "pop": in.set(9); break;
      }
      out[0][i] = in;
      out[1][i] = op1;
      out[2][i] = op2;
      out[3][i] = op2int;
      i++;
    }
    sc.close();
    return out;
  }  
}
