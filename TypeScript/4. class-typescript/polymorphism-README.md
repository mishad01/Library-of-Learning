# Polymorphism in TypeScript

## What is Polymorphism?

Polymorphism means **one interface, many implementations**. The same method name behaves differently depending on which class is running it.

---

## 1. Runtime Polymorphism (Method Overriding)

A child class overrides a parent method. At runtime, JavaScript decides which version to call based on the actual object type.

```ts
class Animal {
    makeSound(): void {
        console.log("Animal makes sound");
    }
}

class Dog extends Animal {
    makeSound(): void { console.log("Woof"); }
}

class Cat extends Animal {
    makeSound(): void { console.log("Meow"); }
}

let animal1: Animal = new Dog();
let animal2: Animal = new Cat();

animal1.makeSound(); // "Woof" — Dog's version runs
animal2.makeSound(); // "Meow" — Cat's version runs
```

Even though `animal1` is typed as `Animal`, it runs `Dog`'s method — that's polymorphism.

**Practical example — array of mixed types:**
```ts
const shapes: Shape[] = [new Circle(), new Square()];

for (const shape of shapes) {
    shape.draw(); // each shape draws itself differently
}
```

---

## 2. Compile-Time Polymorphism (Method Overloading)

Same method name, different parameter types. TypeScript resolves which signature to use at compile time.

```ts
class Calculator {
    add(a: number, b: number): number;
    add(a: string, b: string): string;

    add(a: any, b: any) {
        return a + b;
    }
}

const calc = new Calculator();
console.log(calc.add(5, 3));          // 8
console.log(calc.add("Hello", " World")); // "Hello World"
```

The first two lines are **overload signatures** — they define what's allowed.
The third `add` is the **implementation** — it handles all cases using `any`.

---

## `instanceof` — Check Type at Runtime

When you have a union of object types, use `instanceof` to narrow and safely access specific methods:

```ts
const pet: Animal = new Dog("Buddy");

if (pet instanceof Dog) {
    pet.bark(); // ✅ TypeScript knows it's a Dog here
} else if (pet instanceof Cat) {
    pet.meow(); // ✅ TypeScript knows it's a Cat here
}
```

**With arrays:**
```ts
const animals: Animal[] = [new Dog("Rex"), new Cat("Whiskers")];

for (const animal of animals) {
    if (animal instanceof Dog) {
        animal.bark();
    } else if (animal instanceof Cat) {
        animal.meow();
    }
}
```

---

## Getters

Getters let you access private fields like properties (no parentheses needed):

```ts
class Person {
    private _name: string;

    constructor(name: string) { this._name = name; }

    get name(): string {
        return this._name;
    }
}

const p = new Person("Sakif");
console.log(p.name); // "Sakif" — no () needed, runs the getter
```

---

## Key Takeaways

| Type | How | When |
|---|---|---|
| Runtime polymorphism | Method overriding (`extends`) | Different behavior per subclass |
| Compile-time polymorphism | Method overloading | Same method, different param types |
| `instanceof` | Type narrowing at runtime | Access subclass-specific methods safely |
