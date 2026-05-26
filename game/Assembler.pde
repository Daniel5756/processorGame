import java.util.Scanner;
class Assembler {
  /*
  add %r1 %r2
  
  */
  //%r indicates register
  //()  is a pointer
  public Assembler() {}
  public Register[][] assemble(String[] pgm) {
    Register[][] out = new Register[pgm.length][4];
    int i = 0;
    for (String lineString: pgm) {
      String[] line = lineString.split(" ");
      if (line.length != 0) {
        String instr = line[0];
        Register in = new Register();
        Register op1 = new Register();
        Register op2 = new Register();
        Register op2int = new Register();
        if (line[0].charAt(0) != '#') {//comment
          if (line.length > 1) {
            op1.set((byte) int(line[1].substring(1)));
          }
          if (line.length > 2) {
            if (line[2].charAt(0) == '$') {op2int.set((byte) int(line[2].substring(1))); op2 = null;}
            else {op2.set((byte) int(line[2])); op2int = null;}
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
            case "add": in.set((byte) 0); break;
            case "sub": in.set((byte) 1); break;
            case "mul": in.set((byte) 2); break;
            case "div": in.set((byte) 3); break;
            case "pow": in.set((byte) 4); break;
            case "shl": in.set((byte) 5); break;
            case "cmp": in.set((byte) 6); break;
            case "mov": in.set((byte) 7); break;
            case "psh": in.set((byte) 8); break;
            case "pop": in.set((byte) 9); break;        
            case "jmp": in.set((byte) 10); break;
            case "end": in.set((byte) 11); break;
          }
          out[i][0] = in;
          out[i][1] = op1;
          out[i][2] = op2;
          out[i][3] = op2int;
          i++;
        }
      }
    }
    return out;
  }  
}
