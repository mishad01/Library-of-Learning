# Inheritance in TypeScript

## What is Inheritance?

Inheritance lets a class **reuse** properties and methods from another class using `extends`.

```ts
class User {
    constructor(public userName: string, public age: number) {}

    display(): void {
        console.log(this.userName, this.age);
    }
}

class Student extends User {
    studentId: number;

    constructor(userName: string, age: number, studentId: number) {
        super(userName, age); // must call parent constructor first
        this.studentId = studentId;
    }

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}, id: ${this.studentId}`);
    }
}
```

---

## Key Rules

- Use `extends` to inherit from a parent class
- The child class gets all `public` and `protected` members of the parent
- Must call `super()` before anything else in the child constructor
- Child can **override** parent methods by redefining them

---

## Method Overriding

When a child class redefines a method from the parent, the child's version runs:

```ts
let student1 = new Student("Sakif", 10, 123);
student1.display(); // runs Student's display(), not User's

let user1 = new User("Mishad", 10);
user1.display(); // runs User's display()
```

---

## Key Takeaways

- `extends` = inherit from a parent class
- `super()` = call parent constructor — always first line in child constructor
- Child inherits all public/protected members
- Child can override parent methods with its own implementation
