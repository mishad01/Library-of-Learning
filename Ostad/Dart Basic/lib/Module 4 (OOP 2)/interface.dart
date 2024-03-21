/*an interface is a contract that defines a set of methods that a class must implement if it wants to be considered an instance of that interface.
Interfaces contain method signatures but no method implementations.*/

/*
Implementation:
Implementation refers to providing the actual code for a method or a function defined in a class or an interface.
In our code, the Sakif class provides implementations for the eating() method by defining _movingTheHands() and for the talking() method by directly implementing it.
In the Human abstract class, methods like eating(), moving(), and talking() are declared but not implemented. These methods are abstract, meaning the subclasses must provide their implementations.

Interface:
An interface is a contract that defines a set of methods that a class must implement if it wants to be considered an instance of that interface.
In our code, Human class serves as an interface, although in Dart, it's technically an abstract class. Dart doesn't have explicit interfaces like other languages, but you can achieve similar functionality using abstract classes.
The Human class defines method signatures (e.g., void eating();) without providing the implementation. This indicates that any class implementing the Human interface must provide implementations for these methods.
 */

abstract class Human{
  void eating();
  void moving();
  void talking(){
    print('talking');
  }
}

// Define an interface using an abstract class
//We've hidden a method using encapsulation is known as interface
class Sakif extends Human{
  @override

  //interface
  void eating() {
    _movingTheHands();
  }
 //We are hiding the implementation which is known as implementation.
  void _movingTheHands(){
    print('Moving');
  }

  @override
  void moving() {
    // TODO: implement moving
  }

}

class Hasan implements Human{
  @override
  void eating() {
    // TODO: implement eating
  }
  @override
  void moving() {
    // TODO: implement moving
  }
  @override
  void talking() {
    // TODO: implement talking
  }
}

abstract class Saif implements Human{ //if one abstract class inherit another abstract class then we won't have to override

}

