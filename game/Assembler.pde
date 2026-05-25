import java.util.Scanner;
class Assembler {
  /*
  add %r1 %r2
  
  */
  //%r indicates register
  //()  is a pointer
  public Assembler() {}
  public Register[][] assemble(String pgm) {
    Register[][] out = new Register[pgm.split("\n").length][4];
    Scanner sc = new Scanner(pgm);
    int i = 0;
    while(sc.hasNextLine()) {
      
      String[] line = sc.nextLine().split(" ");
      if (line.length != 0) {
        String instr = line[0];
        Register in = new Register();
        Register op1 = new Register();
        Register op2 = new Register();
        Register op2int = new Register();
        if (line[0].charAt(0) != '#') {//comment
          if (line.length > 1) {
            op1.set(int(line[1].substring(1)));
          }
          if (line.length > 2) {
            if (line[2].charAt(0) == '$') {op2int.set(int(line[2].substring(1))); op2 = null;}
            else {op2.set(int(line[2])); op2int = null;}
          }
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
          10: jmp
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
            case "jmp": in.set(10); break;
            case "end": in.set(11); break;
          }
          out[i][0] = in;
          out[i][1] = op1;
          out[i][2] = op2;
          out[i][3] = op2int;
          i++;
        }
      }
    }
    sc.close();
    return out;
  }  
}
