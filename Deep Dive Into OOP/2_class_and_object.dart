void main() {
  // Creating an object with constructor parameters
  Person person = Person("Mishad", "Rahman");

  // Calling a method from the object
  person.display();

  // Optional: Creating another person with default age
  Person anotherPerson = Person("Tamim", null);
  anotherPerson.display();
}

// Blueprint for a Person //Also blueprint == model
class Person {
  // Nullable and non-nullable fields
  String name;             // Required, non-nullable
  String? fatherName;      // Nullable
  int age;                 // Non-nullable with default value

  // Constructor with required and optional fields
  Person(this.name, this.fatherName, {this.age = 25});

  // Method to show person's info
  void display() {
    // Using null-aware operator to handle nullable field
    print("My Name is $name, Age $age, Father's Name: ${fatherName ?? "Unknown"}");
  }
}
