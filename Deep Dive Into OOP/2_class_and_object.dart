void main(){
Person person = Person("Mishad","24"); // 'Person' is the class (blueprint), 'Person()' creates an object (instance), and 'person' is the reference variable
// /Person person = Person(); // creating an object 'person' from the 'Person' class
  person.display();
}

class Person{
  String? name;
  String? fatherName;
  int age = 25;
  Person(this.name,this.fatherName);
  
  void display(){
    print("My Name is $name, Age $age");
  }
}


// Class works for a blueprint of creating objects
//Blueprint is basically a model