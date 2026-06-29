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
