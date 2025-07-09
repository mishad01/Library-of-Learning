abstract class Shape {
  void draw();
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing Circle");
  }
}

class Square extends Shape {
  @override
  void draw() {
    print("Drawing Square");
  }
}

void main() {
  Shape shape;

  shape = Circle();
  shape.draw();  // Drawing Circle

  shape = Square();
  shape.draw();  // Drawing Square
}
