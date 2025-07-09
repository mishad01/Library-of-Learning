class Student {
  String _name;
  int _age;

  Student(this._name, this._age);

  // Getter for name
  String get name => _name;

  // Setter for name with validation
  set name(String name) {
    if (name.isNotEmpty) {
      _name = name;
    } else {
      print("Name cannot be empty.");
    }
  }

  // Getter for age
  int get age => _age;

  // Setter for age with validation
  set age(int age) {
    if (age > 0) {
      _age = age;
    } else {
      print("Age must be positive.");
    }
  }

  // Update both name and age safely
  void updateStudent({String? newName, int? newAge}) {
    if (newName != null && newName.isNotEmpty) {
      _name = newName;
    }
    if (newAge != null && newAge > 0) {
      _age = newAge;
    }
  }

  // Display student info
  void display() {
    print("Name: $_name, Age: $_age");
  }

  @override
  String toString() => 'Student(name: $_name, age: $_age)';
}

void main() {
  Student student = Student("Mishad", 23);
  student.display();

  print(student); // Uses toString()

  student.age = 25;
  print(student.age);

  student.name = "";
  student.name = "Sakif";
  print(student.name);

  student.updateStudent(newName: "Rakib", newAge: 30);
  print(student);
}
