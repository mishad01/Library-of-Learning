class Animal {
  void makeSound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows");
  }
}

void main() {
  // Polymorphism: A parent class reference (Animal) can hold child class objects (Dog, Cat).
  // The method that gets executed depends on the actual object type, not the reference type.
  Animal animal;

  animal = Dog();
  animal.makeSound();  // Output: Dog barks

  animal = Cat();
  animal.makeSound();  // Output: Cat meows
}
