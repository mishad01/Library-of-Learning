class student {
  var name;
  var age;
  var roll;
  student(var name, var age, var roll) {
    this.name = name;
    this.age = age;
    this.roll = roll;
  }
  void display() {
    print("Name: $name , Age: $age , Roll: $roll");
  }
}

void main() {
  print('Hello World');
  var x = student("Mishad", 22, 221000412);
  x.display();
}
