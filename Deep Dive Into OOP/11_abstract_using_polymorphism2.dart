abstract class Vehicle{
  void start();
  void stopped();
}

class Car extends Vehicle{
  @override
  void start(){
    print("Engine Start");
  }
  @override
  void stopped(){
    print("Engine off");
  }
}

class Bike extends Vehicle{
  @override
  void start(){
    print("Bike Start");
  }
  @override
  void stopped(){
    print("Bike off");
  }
}

void main(){

  Vehicle vehicle;
  vehicle = Car();
  vehicle .start();
  vehicle .stopped();

  vehicle = Bike();
  vehicle.start();
  vehicle.stopped();

  


}