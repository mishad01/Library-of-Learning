/*
  Imagine we have a family tree:


  ->Parent Class (Base Class): Think of this as the top of the family tree.
                               It defines certain characteristics or behaviors that are common to all members of the family.

  ->Child Class (Derived Class): These are like the children or descendants in the family tree.
                                 They inherit traits or properties from their parent class.

  ->Inheritance: Inheritance in Dart allows a child class to inherit properties and methods from its parent class.
                 This means the child class automatically has access to all the features of its parent class without having to redefine them.

 */

// Parent Class/Super Class/Base Class
class Human {
  int hands;
  int legs;
  int eyes;

  Human(this.hands, this.legs, this.eyes);

  void moving() {
    print('Moving');
  }

  void eating() {
    print('Eatingg');
  }

  void talking() {
    print('Talking');
  }
}

//Child Class
/*When we declare a class with the extends keyword, it means that the new class inherits all the non-private members (methods and fields) of the superclass.
 This allows the subclass to reuse the code of the superclass and also extend its functionality by adding new methods or overriding existing ones.
 */
// (super) -> refers to the superclass or parent class of the current class.
class Student extends Human {
  String institute;
  String section;
  Student(int hands, int legs, int eyes, this.institute, this.section)
      : super(hands, legs,
            eyes); //(super) -> refers to the superclass or parent class of the current class

  @override
  void talking() {
    print('Talking Politely');
    super
        .talking(); //If we wanna print the value of the parent class we use this super.talking or super.method name
  }

  @override //If we wanna use or edit existing method we call it override.
  void eating() {
    super
        .eating(); //(super) -> refers to the superclass or parent class of the current class
    print('Dancing while eating');
  }
}

class Teacher extends Human {
  String institution;
  String subject;
  Teacher(super.hands, super.legs, super.eyes, this.institution, this.subject);

  @override
  void moving() {
    print('Moving with notes');
    super.moving();
  }
}

void main() {
  Student studentOne = Student(2, 2, 2, 'EDU', '1');
  // studentOne.eating();
  // studentOne.moving();
  // studentOne.talking();
  // print(studentOne.legs);
  // studentOne.eating();
  Teacher englishTeacher = Teacher(2, 2, 2, 'EDU', 'English');
  englishTeacher.moving();
}
