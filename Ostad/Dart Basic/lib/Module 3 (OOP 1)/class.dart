/*What is class?
 => Class is basically a CUSTOM DATA TYPE.When we create a new data type we make class.Which is also calls User defined data type
 Just like built-in data types such as integers, strings, and lists, classes allow you to define your own data types that suit your specific needs.
 For example, if you're writing a program to model cars, you might create a Car class with attributes like make, model, year, and methods like start_engine() and drive().
*/
// Class is also a blueprint, Blueprint is basically kind of a design.
class Student{
  // IF we don't assign value for variable name then it shows error. To resolve that we use "late"
  //Late is like null safety. Late is a feature is of null safe
  /*late: In Dart, late is a keyword that's used to declare variables which are initialized after their declaration, but before they're used for the first time.
   It allows you to defer the initialization of variables until they're needed.*/
  //All these data types known as "Properties/Attributes"
  late String name;
  late String address;
  late int age;
  static String institution = 'DB';
  //(Static) = we use this when we need a fixed value inside a class, If we change the value in static , then all the value will be changed, Override is not possible

  //It is a constructor. It's also one kind of method. Which gets called automatically when you create an instance
  Student(){}

  //When we create function inside a class that is known as method
  void printSomething(){
    print('Something');
  }

  void playing(){
    print('$name is playing');
  }
}

class Teacher{

  /*late: In Dart, late is a keyword that's used to declare variables which are initialized after their declaration, but before they're used for the first time.
   It allows you to defer the initialization of variables until they're needed.*/
  late String name;
  late String age;
  late String department;


  // Teacher(String n,String a, String d){
  //   name = n;
  //   age = a;
  //   d = d;
  // }

  Teacher({required this.name,required this.age,required this.department,});
  // (required) =  is a keyword used to indicate that a parameter must be provided when calling a constructor.
  // (this) = refers to the current instance of the class. It's used to access members (fields, methods, and constructors) of the current object. In this context, this.name,
}

//What is instance?
//=>When you create an object of a class, you are creating an instance of that class.

void main(){
  List<Student>studentList = [];

  Student student1 = Student(); //student 1 is object name & Student() it is known as constructor
  student1.address='chittagong';
  student1.name = 'Mishad';
  student1.age = 22;
  //student1.institution = 'CB';
  studentList.add(student1);

  Student student2 = Student(); //student 2 is object name & Student() it is known as constructor
  student2.address='chittagong';
  student2.name = 'Sakif';
  student2.age = 22;
  //student2.printSomething();
  // student2.playing();
  // studentList.add(student2);
  // print(studentList);
  //Teacher Biology = Teacher(name: 'X Name', age: '22', department: 'Science');
  //print(Biology.name);
  //print(student1.institution);

}