# `type` vs `interface` in TypeScript

`type` and `interface` are the two main ways to name a shape in
TypeScript. They look similar and do many of the same things, but they
are not identical. This is one of the most common TypeScript interview
questions.

---

## Table of Contents

1. [What they have in common](#what-they-have-in-common)
2. [The basic syntax](#the-basic-syntax)
3. [Where they differ](#where-they-differ)
4. [Declaration merging](#declaration-merging)
5. [Extending vs intersecting](#extending-vs-intersecting)
6. [What only `type` can do](#what-only-type-can-do)
7. [What only `interface` can do](#what-only-interface-can-do)
8. [When to use which](#when-to-use-which)
9. [Quick reference table](#quick-reference-table)

---

## What they have in common

Both can describe object shapes.

```ts
type UserA = { name: string; age: number };

interface UserB {
    name: string;
    age: number;
}
```

Both can be used as the type of a variable, a parameter, or a return
value.

```ts
function greetA(u: UserA) { console.log(u.name); }
function greetB(u: UserB) { console.log(u.name); }
```

Both support optional and read-only fields.

```ts
type T = { name: string; age?: number; readonly id: string };
interface I { name: string; age?: number; readonly id: string }
```

---

## The basic syntax

```ts
// type uses `=`
type Point = { x: number; y: number };

// interface does not use `=`
interface Point2 {
    x: number;
    y: number;
}
```

---

## Where they differ

The main differences:

| Feature                 | `type`              | `interface`          |
| ----------------------- | ------------------- | -------------------- |
| Object shape            | Yes                 | Yes                  |
| Union types             | Yes                 | No                   |
| Primitives              | Yes (`type N = number`) | No                |
| Tuples                  | Yes                 | No (awkward)         |
| Extend another          | `&` intersection    | `extends`            |
| Declaration merging     | No                  | Yes                  |
| Classes can implement   | Yes (if it is an object) | Yes             |

---

## Declaration merging

This is the **biggest** unique feature of `interface`. You can declare
the same interface name twice, and TypeScript merges them.

```ts
interface User {
    name: string;
}

interface User {
    age: number;
}

const u: User = { name: "Sakif", age: 25 }; // both fields required
```

You **cannot** do this with `type`:

```ts
type User = { name: string };
// type User = { age: number }; // Error: duplicate identifier
```

This makes `interface` great for libraries that want users to add
fields to existing types (e.g., extending the `Window` object).

---

## Extending vs intersecting

**Interface extends:**

```ts
interface Animal { name: string }
interface Dog extends Animal { breed: string }
```

**Type intersection:**

```ts
type Animal = { name: string };
type Dog = Animal & { breed: string };
```

Both achieve the same result. Choose based on style.

You can also mix them:

```ts
interface Dog extends Animal { breed: string }       // OK
type DogType = Animal & { breed: string };           // OK
```

---

## What only `type` can do

**1. Union types:**

```ts
type Status = "loading" | "success" | "error";
type Id = string | number;
```

**2. Primitive aliases:**

```ts
type Age = number;
type Name = string;
```

**3. Tuple types:**

```ts
type Point = [number, number];
```

**4. Mapped, conditional, and template literal types (advanced):**

```ts
type Keys = "a" | "b";
type Map = { [K in Keys]: number }; // { a: number, b: number }
```

---

## What only `interface` can do

**1. Declaration merging** (shown above).

**2. Cleaner `extends` syntax** with multiple parents:

```ts
interface A { a: string }
interface B { b: number }
interface C extends A, B { c: boolean }
```

(You can do the same with `&`, but `extends` is often clearer in
classes.)

---

## When to use which

There is no strict rule. A practical guideline:

- **Use `interface`** for **object shapes** that may be extended
  (especially public APIs, library types, or React props).
- **Use `type`** for **everything else** — unions, tuples, primitives,
  function signatures, complex utility types.

**Examples:**

```ts
// Object shape — interface is fine
interface User {
    id: number;
    name: string;
}

// Union — must use type
type Status = "idle" | "loading" | "done";

// Function — either works
type Add = (a: number, b: number) => number;
interface Add2 {
    (a: number, b: number): number;
}
```

> Whichever you pick, stay consistent across your project.

---

## Quick reference table

| Capability               | `type`           | `interface`         |
| ------------------------ | ---------------- | ------------------- |
| Object shape             | Yes              | Yes                 |
| Optional / readonly      | Yes              | Yes                 |
| Union                    | Yes              | No                  |
| Primitive alias          | Yes              | No                  |
| Tuple                    | Yes              | No                  |
| Function signature       | Yes              | Yes (call sig.)     |
| Extend / combine         | `&`              | `extends`           |
| Declaration merging      | No               | Yes                 |
| Classes implement        | Yes (objects)    | Yes                 |
| Mapped / conditional     | Yes              | No                  |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this              | Example                                  |
| -------------------------------------------------------------------- | --------------------- | ---------------------------------------- |
| Defining React component props                                       | `interface` or `type` | `interface Props { title: string }`      |
| Class that must implement specific methods                           | `interface`           | `class X implements IRepo`               |
| Type that's a union of literals or types                             | `type`                | `type Status = "ok" \| "err"`            |
| Aliasing a primitive (Id, Name, etc.)                                | `type`                | `type Id = string \| number`             |
| Naming a tuple                                                       | `type`                | `type Point = [number, number]`          |
| Defining a function signature                                        | `type`                | `type Cb = (n: number) => void`          |
| Library type others may extend with fields (`Window`)                | `interface`           | declaration merging                      |
| Mapped types (`{ [K in keyof T]: ... }`)                             | `type`                | `type Readonly<T> = { ... }`             |
| Conditional types (`T extends U ? A : B`)                            | `type`                | `type If<T> = T extends string ? ... : ...` |
| Object shape used by classes (must implement)                        | `interface`           | `interface User { greet(): void }`       |
| Combining several shapes into one                                    | `type` with `&`       | `type X = A & B`                         |
| Inheriting from one or more parents (clean OO)                       | `interface extends`   | `interface C extends A, B`               |
| Default choice for plain object shapes (team has no preference)      | Either — be consistent| Pick one and stick with it               |

---

## Running the examples

From this folder:

```bash
npx ts-node "type-vs-interface.ts"
```
