class Laptop{
  String brand;
  int price;
  Laptop(this.brand,this.price){
    print("Laptop Called");
  }

  void displayInfo(){
    print('Brand : $brand, Price : $price');
  }
}

class Macbook extends Laptop{
  String model;
  Macbook(String brand,int price, this.model):super(brand,price); //We use super key to basically transfer the values from child class to parent class

  void displayInfo(){
    super.displayInfo(); //Also super used to call the method of parent class 
    print('Model : $model');
  }
}

void main(){
  Macbook macbook = Macbook("Samsung",20000,"14");
  macbook.displayInfo();
  
}