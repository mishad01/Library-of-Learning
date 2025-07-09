//Interface class, concrete class
class Laptop{
  void turnOn(){
    print("Laptop turn on");
  }

  void turnOff(){
    print("Laptop turn off");
  }
}

class MacBook implements Laptop{
  @override
  void turnOn(){
    print("Macbook turn on");
  }

  @override
  void turnOff(){
    print("Macbook turn off");
  }
}

void main(){
  MacBook macBook = MacBook();
  macBook.turnOn();
  macBook.turnOff();
}