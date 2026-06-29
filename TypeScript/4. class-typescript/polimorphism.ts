abstract class Person {
    private _name: string;
    private _age: number;

    constructor(name: string, age: number) {
        this._age = age;
        this._name = name;
    }

    get name(): string {
        return this._name;
    }
    get age(): number {
        return this._age;
    }

    //Abstract Method
    abstract getDescription():string;
}


// Student class (Inheritance)
class Student extends Person {
  private _grade: number;

  constructor(name: string, age: number, grade: number) {
    super(name, age);
    this._grade = grade;
  }

  get grade(): number {
    return this._grade;
  }

  // Implementing abstract method (Polymorphism)
  getDescription(): string {
    return `Student: ${this.name}, Age: ${this.age}, Grade: ${this.grade}`;
  }
}

// Teacher class (Inheritance)
class Teacher extends Person {
  private _subject: string;

  constructor(name: string, age: number, subject: string) {
    super(name, age);
    this._subject = subject;
  }

  get subject(): string {
    return this._subject;
  }

  // Implementing abstract method (Polymorphism)
  getDescription(): string {
    return `Teacher: ${this.name}, Age: ${this.age}, Subject: ${this.subject}`;
  }
}

class User {
    readonly userName: string;
    public age: number;

    constructor(userName: string, age: number) {
        this.userName = userName;
        this.age = age;
    }

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}`);
    }
}

// Create instances and demonstrate polymorphism
const student = new Student("Alice", 20, 90);
const teacher = new Teacher("Bob", 45, "Mathematics");


console.log(student.getDescription()); // Student: Alice, Age: 20, Grade: 90
console.log(teacher.getDescription()); // Teacher: Bob, Age: 45, Subject: Mathematics

// Encapsulation: attempting to access private properties directly will result in an error
// console.log(student._name); // Error: Property '_name' is private and only accessible within class 'Person'.
// console.log(teacher._subject); // Error: Property '_subject' is private and only accessible within class 'Teacher'.

// Use getter methods to access encapsulated properties
console.log(student.name); // Alice
console.log(teacher.subject); // Mathematics



// 1. Runtime Polymorphism (Overriding)

// Same concept as Dart.

// A child class overrides a parent method, and at runtime JavaScript decides which one to execute.

class Animal {
  makeSound(): void {
    console.log("Animal makes sound");
  }
}

class Dog extends Animal {
  makeSound(): void {
    console.log("Woof");
  }
}

class Cat extends Animal {
  makeSound(): void {
    console.log("Meow");
  }
}

let animal1: Animal = new Dog();
let animal2: Animal = new Cat();

animal1.makeSound();
animal2.makeSound();



///////////////////////////////////////

class Shape {
  draw() {
    console.log("Drawing shape");
  }
}

class Circle extends Shape {
  draw() {
    console.log("Drawing circle");
  }
}

class Square extends Shape {
  draw() {
    console.log("Drawing square");
  }
}

//const shapes: Shape[] = [new Circle(), new Square()];
const shapes:Shape[] = [new Circle(), new Square()];

for (const shape of shapes) {
  shape.draw();
}

// 2. Compile-Time Polymorphism (Method Overloading)
// TypeScript supports this.
// Same method name, different parameter types.

class Calculator{
  add(a:number,b:number):number;
  add(a: string, b: string): string;

  add (a:any,b:any){
    return a+b;
  }
}

const calc = new Calculator();
console.log(calc.add(5,3));
console.log(calc.add("Hello"," World"));


// ─── instanceof — check which class an object belongs to at runtime ──────────
class Animal2 {
    name: string;
    constructor(name: string) { this.name = name; }
}

class Dog2 extends Animal2 {
    bark() { console.log("Woof"); }
}

class Cat2 extends Animal2 {
    meow() { console.log("Meow"); }
}

const pet: Animal2 = new Dog2("Buddy");

if (pet instanceof Dog2) {
    pet.bark(); // ✅ TypeScript now knows it's a Dog2, so bark() is accessible
} else if (pet instanceof Cat2) {
    pet.meow();
}

// instanceof with array of mixed types
const animals: Animal2[] = [new Dog2("Rex"), new Cat2("Whiskers"), new Dog2("Max")];

for (const animal of animals) {
    if (animal instanceof Dog2) {
        animal.bark();
    } else if (animal instanceof Cat2) {
        animal.meow();
    }
}