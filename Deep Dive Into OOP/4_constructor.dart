// 1. Default Constructor
class PersonDefault {
  String name = "Sakif";

  void greet() {
    print("Hello, my name is $name");
  }
}

// 2. Parameterized Constructor
class PersonParameterized {
  String name;
  int age;

  PersonParameterized(String name, int age)
      : this.name = name,
        this.age = age;

  void display() {
    print("Name: $name, Age: $age");
  }
}

// 3. Shorthand Constructor
class PersonShorthand {
  String name;
  int age;

  PersonShorthand(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}

// 4. Named Constructor
class Student {
  String name;
  int age;

  Student(this.name, this.age);

  Student.named()
      : name = "Default Name",
        age = 18;

  void display() {
    print("Name: $name, Age: $age");
  }
}


// 5. Const Constructor
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

// 6. Optional Positional Parameters
class PersonOptionalPositional {
  String name;
  int? age;

  PersonOptionalPositional(this.name, [this.age]);

  void display() {
    print("Name: $name, Age: ${age ?? 'Unknown'}");
  }
}

// 7. Named Parameters (Required)
class PersonNamedRequired {
  String name;
  int age;

  PersonNamedRequired({required this.name, required this.age});

  void display() {
    print("Name: $name, Age: $age");
  }
}

// 8. Named Parameters (Optional)
class PersonNamedOptional {
  String? name;
  int? age;

  PersonNamedOptional({this.name, this.age});
  
  void display() {
    print("Name: ${name ?? "N/A"}, Age: ${age ?? "N/A"}");
  }
}

// 9. Named Parameters with Default Values
class PersonWithDefaults {
  String name;
  int age;

  PersonWithDefaults({this.name = "Guest", this.age = 18});

  void display() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  // 1. Default Constructor
  var personDefault = PersonDefault();
  personDefault.greet();

  // 2. Parameterized Constructor
  var personParam = PersonParameterized("Mishad", 24);
  personParam.display();

  // 3. Shorthand Constructor
  var personShort = PersonShorthand("Sakif", 22);
  personShort.display();

  // 4. Named Constructor
  var student1 = Student("Riyad", 21);
  var student2 = Student.named();
  student1.display();
  student2.display();

  // 5. Const Constructor
  const point1 = Point(1, 2);
  const point2 = Point(1, 2);
  print(identical(point1, point2)); // true

  // 6. Optional Positional Parameters
  var personOpt1 = PersonOptionalPositional("Sakif", 25);
  var personOpt2 = PersonOptionalPositional("Tamim");
  personOpt1.display();
  personOpt2.display();

  // 7. Named Parameters (Required)
  var personNamedReq = PersonNamedRequired(name: "Rakib", age: 30);
  personNamedReq.display();

  // 8. Named Parameters (Optional)
  var personNamedOpt = PersonNamedOptional(age: 27);
  personNamedOpt.display();

  // 9. Named Parameters with Default Values
  var personDefaultVals = PersonWithDefaults();
  personDefaultVals.display();
}
