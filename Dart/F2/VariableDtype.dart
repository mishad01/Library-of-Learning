import 'dart:ffi';
import 'dart:io';

void main() {
  String? number = stdin.readLineSync();
  int n = int.parse(number!); //Way of taking integer input
  print(n);
  //String? b = stdin.readLineSync();
  String? x = stdin.readLineSync();
  double c = double.parse(x!);
  print(c);
  Char d;
  Float e;
  var z = stdin.readLineSync();
  print(z);
}
