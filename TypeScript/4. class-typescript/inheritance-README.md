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

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Several classes share the same fields/methods                        | `extends` parent          | `class Admin extends User`               |
| Building a hierarchy: `Animal -> Dog -> Labrador`                    | Multi-level inheritance   | `class Lab extends Dog`                  |
| Child needs to call parent's constructor                             | `super(...)`              | `super(userName, age)`                   |
| Child wants to customize parent behavior                             | Method overriding         | Redefine method in child class           |
| Child wants to extend parent behavior (run parent + extra)           | `super.method()` in child | `super.display(); console.log(...)`     |
| Don't want anyone to instantiate the parent directly                 | `abstract class` (next)   | `abstract class Shape { ... }`           |
| Parent should expose a contract only, no implementation              | `interface` instead       | `interface User { display(): void }`     |
| Sharing common logic across only-similar classes (not real "is-a")   | Composition (helper class)| Use a helper or mixin instead            |
| React-like component class extending base component                  | `extends`                 | `class App extends Component`            |
