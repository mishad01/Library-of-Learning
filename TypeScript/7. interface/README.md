# Interfaces in TypeScript

## What is an Interface?

An interface defines the **shape** of an object — what properties and methods it must have. It's a contract.

**Without interface — repetitive:**
```ts
let user1: { id: number; name: string; age: number } = { ... };
let user2: { id: number; name: string; age: number } = { ... };
let user3: { id: number; name: string; age: number } = { ... };
```

**With interface — clean:**
```ts
interface IUser {
    id: number;
    name: string;
    age: number;
}

let user1: IUser = { id: 1, name: "Sakif", age: 25 };
let user2: IUser = { id: 2, name: "Mishad", age: 22 };
```

---

## `readonly` and Optional Properties

```ts
interface IUser {
    readonly id: number;  // cannot be changed after assignment
    name: string;
    age?: number;         // optional — caller can skip it
}

let user: IUser = { id: 1, name: "Sakif" }; // age is optional ✅
// user.id = 99; // ❌ Error — id is readonly
```

---

## Function Signatures in Interface

```ts
interface IMath {
    add(a: number, b: number): number;
    subtract(a: number, b: number): number;
}

const math: IMath = {
    add: (a, b) => a + b,
    subtract: (a, b) => a - b,
};

console.log(math.add(5, 3));      // 8
console.log(math.subtract(5, 3)); // 2
```

---

## `implements` — Class Contracts

A class can implement an interface, promising to provide all required members:

```ts
interface IUserFormatter {
    formatUser(): string;
}

class User implements IUserFormatter {
    constructor(public userName: string, public age: number) {}

    formatUser(): string {
        return `Name: ${this.userName}, Age: ${this.age}`;
    }
}
```

If `User` doesn't implement `formatUser()`, TypeScript throws an error.

---

## Extending Interfaces

Interfaces can extend other interfaces — inheriting all their properties:

```ts
interface IAnimal {
    name: string;
}

interface IDog extends IAnimal {
    breed: string;
}

const dog: IDog = {
    name: "Rex",     // inherited from IAnimal
    breed: "Labrador"
};
```

**Extending multiple interfaces:**
```ts
interface IEmployee extends IAddress, IContact {
    employeeId: number;
    name: string;
}
```

---

## `interface` vs `type`

Both define the shape of an object, but they have key differences:

```ts
type TUser = { id: number; name: string; };
interface IUser { id: number; name: string; }
```

| | `interface` | `type` |
|---|---|---|
| Extend | `extends` keyword | `&` intersection |
| Declaration merging | ✅ Can re-open and add properties | ❌ Cannot redeclare |
| Unions/primitives | ❌ Cannot | ✅ `type ID = string \| number` |

**Declaration merging (interface only):**
```ts
interface IUser { id: number; }
interface IUser { age: number; } // ✅ merges — IUser now has both id and age
```

**Rule of thumb:**
- Use `interface` for object shapes and class contracts
- Use `type` for unions, primitives, and utility types

---

## Summary

| Feature | Syntax |
|---|---|
| Define shape | `interface IFoo { ... }` |
| Optional property | `age?: number` |
| Readonly property | `readonly id: number` |
| Function signature | `add(a: number, b: number): number` |
| Class implements | `class Foo implements IFoo` |
| Extend interface | `interface IBar extends IFoo` |
| Extend multiple | `interface IBaz extends IFoo, IBar` |
