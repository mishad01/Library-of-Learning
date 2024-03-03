/*It's a blueprint for other classes but cannot be directly instantiated.
Abstract classes are often used to define a common interface or set of methods that subclasses must implement.*/

/*On the other hand we can also say. We will be creating a method inside parent class but there is not going to be any implementation.
The implementation will be in subclasses only*/

// Abstract class doesn't have any existence

/*Rules for Abstract :
1. We won't be able to initiate object for abstract class.
   Abstract classes cannot be instantiated directly using the new keyword. Attempting to do so will result in a compile-time error.
2. Abstract classes can declare methods without implementing them. These methods are termed abstract methods and must be implemented by non-abstract subclasses.
3.Subclasses must implement abstract methods
 */
abstract class Student{
  void reading(){}
  void joiningClass();

  void playing(){
    print('Playing valorant'); //If we implement inside error it won't throw any error in subclasses.
  }
}

class CSEStudent extends Student{
  @override
  void reading(){
    print('Reading some code');
  }
  @override
  void joiningClass() {
    // TODO: implement joiningClass
  }
}

class PharmacyStudent extends Student{
  @override
  void reading() {
    print('Reading Biology');
  }
  @override
  void joiningClass() {
    // TODO: implement joiningClass
  }
}

// Implements keyword is used for implementing interfaces in Dart, not for inheriting from abstract classes.
// To inherit from the Student class, extends keyword should be used instead
//After using implements key word we have to change the implementation of method
class LawStudent implements Student,CSEStudent,PharmacyStudent{
  @override
  void reading() {
    // TODO: implement reading
  }
  @override
  void joiningClass() {
    // TODO: implement joiningClass
  }
  @override
  void playing() {
    // TODO: implement playing
  }
}


void main (){
 // Student student = Student();  Rules for abstract class is that, We won't be able to initiate object for abstract class.
  CSEStudent student = CSEStudent();
  student.reading();

  PharmacyStudent pharmacyStudent = PharmacyStudent();
  pharmacyStudent.reading();
}