import 'dart:math';

// class BlueGenerator {
//   static String BlueGenerators() {
//     String start = "Bl";
//     String end = "csh";
//
//     List<int> a = new List<int>.generate(26, (int index) => index + 65);
//     a.shuffle(Random());
//     String f = String.fromCharCodes(a);
//     f = start + f + end;
//     return f;
//   }
//
// }
class BlueGenerator {
  static String generateRandomString() {
    String start = "Bl";
    String end = "csh";
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var finalString =
        List.generate(27, (index) => _chars[r.nextInt(_chars.length)]).join();
    finalString = start + finalString + end;
    return finalString;
  }
}

void main() {
  print(BlueGenerator.generateRandomString());
}
//
// void main() {
//   print(BlueGenerator.BlueGenerators());
// }
