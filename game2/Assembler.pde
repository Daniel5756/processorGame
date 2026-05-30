import java.util.Scanner;
class Assembler {
  /*ogohif  wghuilg oiwqy bwjlhc fujh iptbjn 34iopqm bfop4q3im opwrjksl;aifhyiljnsxopijknopqjhpoij53p jiphdipjgntipjknio uhnequiofn seipbn p o4jwjoijq[v jt[oi [oijq3o[ij  o[ijh[k  1\[pk [gpk'k  ]kap[o j[oj oe 5o[ejw3[o jh[ejy6j g,m e5yokmwto[khmo[kmojno5y '
  add %r1 %r2
  
  */
  //%r indicates int
  //()  is a pointer
  public Assembler() {}
  public int[][] assemble(String[] pgm) {
    int[][] out = new int[pgm.length][4];
    int i = 0;
    for (int index = 0; index < pgm.length; index++) {
      String[] line = pgm[index].split("\\s+");
      if (line.length != 0) {
        String instr = line[0];
        int in = 0;
        int op1 = 0;
        int op2 = 0;
        int op2int = 0;
 
          if (line.length > 1) {
            op1 = unhex(line[1].substring(0));
          }
          if (line.length > 2) {
            if (line[2].charAt(0) == '$') {op2int = (int) unhex(line[2].substring(1)); op2 = -1;}
            else if (line[2].equals(".")) {op2int = index; op2 = -1;}
            else {op2 = unhex(line[2]); op2int = 0;}
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
            case "add": in = 0; break;
            case "sub": in = 1; break;
            case "mul": in = 2; break;
            case "div": in = 3; break;
            case "pow": in = 4; break;
            case "shl": in = 5; break;
            case "cmp": in = 6; break;
            case "mov": in = 7; break;
            case "psh": in = 8; break;
            case "pop": in = 9; break;        
            case "jmp": in = 10; break;
            case "end": in = 11; break;
            case "cll": in = 12; break;
            case "ret": in = 13; break;
            case "mea": in = 14; break; //mov but it moves mov ((input-addr)) thing
            case "rec": in = 15; break;
          }
          out[i][0] = in;
          out[i][1] = op1;
          out[i][2] = op2;
          out[i][3] = op2int;
          i++;
        }
      }
    
    return out;
  }  
}
