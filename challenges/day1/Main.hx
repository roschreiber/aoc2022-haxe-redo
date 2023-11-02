import sys.io.File;
import sys.io.FileInput;

class Main {
  static public function main() : Void {
    var Input : FileInput = File.read("input.txt");
    var sum : Int = 0;
    var n1 : Int = 0;
    var n2 : Int = 0;
    var n3 : Int = 0;
    var total : Int = 0;

    try {
      while (true) {
        var line : String = Input.readLine();

        if (line.length == 0) {
          if (sum > n1) {
            n3 = n2;
            n2 = n1;
            n1 = sum;
          } else if (sum > n2) {
            n3 = n2;
            n2 = sum;
          } else if (sum > n3) {
            n3 = sum;
          }
          sum = 0;
        } else {
          var value : Int = Std.parseInt(line);
          sum += value;
        }
      }
    } catch (Eof) {
      // https://stackoverflow.com/questions/49289193/reading-a-file-line-by-line-but-the-last-line-is-empty-in-haxe
    }

    total = n1 + n2 + n3;

    trace("1: " + n1);
    trace("2: " + n2);
    trace("3: " + n3);
    trace("Total: " + total);
  }
}