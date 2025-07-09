//Parent
class Vehicle{
  String brand;
  String model;
  int year;

  Vehicle(this.brand,this.model,this.year);

  void displayInfo(){
    print("Brand : $brand");
    print("Model : $model");
    print("Year : $year");
  }

  double calculateRentalPrice(int days){
    return days * 50; //Base price 
  }
}

class Car extends Vehicle{
  int door;

  Car(String brand,String model,int year,this.door):super(brand,model,year);

  @override
  double calculateRentalPrice(int days){
    return super.calculateRentalPrice(days) + 20 * door; 
  }
}

void main(){
  Car car = Car("Toyota", "Campry", 2024, 5);
  print("Car Information");
  car.displayInfo();
  print("Rental price for 5 days : \$ ${car.calculateRentalPrice(5)}");
}