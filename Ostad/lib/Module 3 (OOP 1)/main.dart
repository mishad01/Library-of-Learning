import 'package:untitled/Module%203%20(OOP%201)/encapsulation_person.dart';
/*Encapsulation in is like putting  code in a box and giving it a lock.
 The box protects the code inside from being directly accessed or modified by anything outside the box.*/

void main(){
  Person randomPerson = Person('Sakif Rahman', 'Mishad', 'Male', 22);
  print(randomPerson.getFullName());
  randomPerson.changeGender('Male');
  print(randomPerson.getGender());
  randomPerson.setAge=20;
}

