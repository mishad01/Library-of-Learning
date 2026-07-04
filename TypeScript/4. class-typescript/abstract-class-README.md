# Abstract Classes in TypeScript

## What is an Abstract Class?

An abstract class is a class that **cannot be instantiated directly**. It exists only to be extended by other classes.

```ts
abstract class User {
    userName: string;
    age: number;

    constructor(userName: string, age: number) {
        this.userName = userName;
        this.age = age;
    }

    abstract display(): void; // no body — subclasses MUST implement this
}

// new User("Sakif", 10); // ❌ Error — cannot instantiate abstract class
```

---

## Abstract Methods

An abstract method has **no body** — it's just a declaration. Every subclass is forced to provide its own implementation.

```ts
class Student extends User {
    studentId: number;

    constructor(userName: string, age: number, studentId: number) {
        super(userName, age);
        this.studentId = studentId;
    }

    display(): void { // ✅ must implement abstract method
        console.log(`username: ${this.userName}, age: ${this.age}, id: ${this.studentId}`);
    }
}

let student1 = new Student("keya", 31, 1302020015);
student1.display();
```

---

## Abstract Class vs Regular Class

| | Regular Class | Abstract Class |
|---|---|---|
| Can instantiate directly | ✅ Yes | ❌ No |
| Can have abstract methods | ❌ No | ✅ Yes |
| Subclass must implement abstract methods | N/A | ✅ Yes — enforced by TypeScript |

---

## When to use Abstract Classes?

Use them when you want to define a **common structure** but each subclass should have its own implementation of certain methods.

Example: `Shape` is abstract, but `Circle` and `Square` each draw differently.

---

## Key Takeaways

- `abstract class` = cannot be instantiated, only extended
- `abstract method` = no body, subclasses must implement it
- TypeScript will throw an error if a subclass doesn't implement all abstract methods
- Great for enforcing a consistent interface across related classes

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Common base behavior + forcing subclasses to implement specifics     | `abstract class`          | `abstract class Shape { abstract area() }`|
| You want shared state + abstract methods together                    | `abstract class`          | (interfaces can't have state)            |
| Pure contract, no implementation, no state                           | `interface` instead       | `interface Drawable { draw(): void }`    |
| Prevent direct instantiation of a base class                         | `abstract class`          | `new Shape()  // ❌ error`               |
| `Shape` -> `Circle` / `Square` style hierarchy with shared fields    | `abstract class`          | `abstract class Shape { color: string }` |
| Payment processor with `processPayment()` abstract per provider      | `abstract class`          | `abstract class Payment { abstract process() }`|
| Game character base with `attack()` to be defined by each subclass   | `abstract class`          | `abstract class Character { abstract attack() }`|
| You only need a function signature contract (no fields)              | `interface` / `type`      | `type Drawable = { draw(): void }`       |
| Multiple inheritance needed                                          | `interface` (classes implement multiple) | `class A implements I1, I2` |
