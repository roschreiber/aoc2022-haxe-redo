import sys.io.File;
import sys.io.FileInput;

class Main {
  static public function main() : Void {
    var Input : FileInput = File.read("input.txt");
    var score : Int = 0;

    try {
      while (true) {
        var line : String = Input.readLine();
        var values : Array<String> = line.split(" ");

        if (values[0] == "A" && values[1] == "Y" ||  // if won
            values[0] == "B" && values[1] == "Z" ||
            values[0] == "C" && values[1] == "X") {
          score += 6;
        }

        if (values[0] == "A" && values[1] == "X" ||  // if draw
            values[0] == "B" && values[1] == "Y" ||
            values[0] == "C" && values[1] == "Z") {
          score += 3;
        }

        if (values[1] == "X") {  // if loss
          score += 1;
        } else if (values[1] == "Y") {
          score += 2;
        } else if (values[1] == "Z") {
          score += 3;
        }
      }
    } catch (Eof) {
      // https://stackoverflow.com/questions/49289193/reading-a-file-line-by-line-but-the-last-line-is-empty-in-haxe
    }

    trace(score);
  }
}