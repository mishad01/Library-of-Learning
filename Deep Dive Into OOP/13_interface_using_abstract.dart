//Interface
abstract class Animal{
  //abstract method
  void sound();
  //Non-abstract method as we defined body
  void eat(){
    print("The animal is eating");
  }
}

class Dog extends Animal{
  @override
  void sound(){
    super.eat();
    print("Dog Barks");
  }
}

class Cat extends Animal{
  @override
  void sound(){
    print("Cat Meow");
  }
}

void main(){
  Dog dog = Dog();
  //dog.eat();
  dog.sound();

}