# Type Narrowing and Type Guards in TypeScript

When a value can be more than one type (like `string | number`),
TypeScript will not let you use type-specific methods until it knows
which type the value really is. **Narrowing** is the process of making
the type more specific. **Type guards** are the tools you use to do it.

---

## Table of Contents

1. [What is narrowing?](#what-is-narrowing)
2. [`typeof` guard](#typeof-guard)
3. [`instanceof` guard](#instanceof-guard)
4. [`in` operator guard](#in-operator-guard)
5. [Equality narrowing](#equality-narrowing)
6. [Truthiness narrowing](#truthiness-narrowing)
7. [Custom type guards (`is`)](#custom-type-guards-is)
8. [Discriminated unions](#discriminated-unions)
9. [Real world examples](#real-world-examples)
10. [Quick reference table](#quick-reference-table)

---

## What is narrowing?

Suppose you have this function:

```ts
function print(value: string | number) {
    console.log(value.toUpperCase()); // Error!
}
```

TypeScript says: "What if `value` is a number? Numbers do not have
`toUpperCase()`." So you must **narrow** the type first.

```ts
function print(value: string | number) {
    if (typeof value === "string") {
        // Inside here, TypeScript knows value is a string
        console.log(value.toUpperCase()); // OK
    } else {
        // Here, TypeScript knows value is a number
        console.log(value.toFixed(2)); // OK
    }
}
```

---

## `typeof` guard

Used to check **primitive types**: `"string"`, `"number"`, `"boolean"`,
`"undefined"`, `"object"`, `"function"`, `"symbol"`, `"bigint"`.

```ts
function format(value: string | number) {
    if (typeof value === "string") {
        return value.trim();
    }
    return value.toFixed(2);
}
```

---

## `instanceof` guard

Used to check **classes**.

```ts
class Dog {
    bark() { console.log("Woof"); }
}

class Cat {
    meow() { console.log("Meow"); }
}

function makeSound(pet: Dog | Cat) {
    if (pet instanceof Dog) {
        pet.bark();
    } else {
        pet.meow();
    }
}
```

`instanceof` works only with things made by `new`, like classes,
`Date`, `Error`, etc.

---

## `in` operator guard

Used to check if a **property exists** on an object.

```ts
type Dog = { breed: string };
type Cat = { lives: number };

function describe(pet: Dog | Cat) {
    if ("breed" in pet) {
        console.log(`Dog breed: ${pet.breed}`);
    } else {
        console.log(`Cat lives: ${pet.lives}`);
    }
}
```

Useful for objects that do not come from classes.

---

## Equality narrowing

TypeScript can narrow based on `===` and `!==` checks.

```ts
function example(a: string | number, b: string | boolean) {
    if (a === b) {
        // Both must be string (only common type)
        console.log(a.toUpperCase());
    }
}
```

---

## Truthiness narrowing

A simple `if (value)` removes `null`, `undefined`, `0`, `""`, and `false`.

```ts
function greet(name: string | null) {
    if (name) {
        // name is now string (not null)
        console.log(name.toUpperCase());
    }
}
```

> **Careful:** This also removes `0` and `""`. If those are valid, use
> `if (name !== null)` instead.

---

## Custom type guards (`is`)

Sometimes the built-in guards are not enough. You can write your own
function that returns a special type — `value is Type`.

```ts
type Fish = { swim: () => void };
type Bird = { fly: () => void };

function isFish(pet: Fish | Bird): pet is Fish {
    return (pet as Fish).swim !== undefined;
}

function move(pet: Fish | Bird) {
    if (isFish(pet)) {
        pet.swim(); // TypeScript knows it is a Fish
    } else {
        pet.fly();
    }
}
```

The `pet is Fish` return type tells TypeScript: "if this function
returns true, treat `pet` as `Fish`."

---

## Discriminated unions

A pattern where each object in a union has a shared "tag" property.
This is the cleanest way to narrow.

```ts
type Square = { kind: "square"; size: number };
type Circle = { kind: "circle"; radius: number };
type Shape = Square | Circle;

function area(shape: Shape): number {
    switch (shape.kind) {
        case "square":
            return shape.size * shape.size;
        case "circle":
            return Math.PI * shape.radius ** 2;
    }
}
```

The `kind` field is the **discriminator**. TypeScript uses it to figure
out which type you are working with.

See folder `20. discriminated-unions` for more on this.

---

## Real world examples

**Form validation:**

```ts
function validate(input: string | null) {
    if (!input) {
        return "Required";
    }
    if (input.length < 3) {
        return "Too short";
    }
    return null;
}
```

**API response handling:**

```ts
type Success = { status: "ok"; data: User };
type Failure = { status: "error"; message: string };

function handle(res: Success | Failure) {
    if (res.status === "ok") {
        console.log(res.data.name);
    } else {
        console.log("Error:", res.message);
    }
}
```

---

## Quick reference table

| Guard               | Use for                       | Example                          |
| ------------------- | ----------------------------- | -------------------------------- |
| `typeof`            | Primitive types               | `typeof x === "string"`          |
| `instanceof`        | Classes / built-in objects    | `x instanceof Date`              |
| `in`                | Object properties             | `"breed" in pet`                 |
| `===` / `!==`       | Equality                      | `status === "ok"`                |
| Truthiness          | Remove null/undefined/0/""    | `if (value)`                     |
| Custom (`is`)       | Your own logic                | `function isUser(x): x is User`  |
| Discriminated union | Shared tag property           | `switch (shape.kind)`            |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Check if a value is a string or number                               | `typeof`                  | `if (typeof x === "string")`             |
| Check if a value is a `Date`, `Error`, or class instance             | `instanceof`              | `if (e instanceof Error)`                |
| Check if an object has a specific property (no class)                | `in` operator             | `if ("breed" in pet)`                    |
| Narrowing by checking string literal value                           | `===` equality            | `if (status === "ok")`                   |
| Quick null / undefined / empty check                                 | Truthiness `if (x)`       | `if (name)`                              |
| Want to exclude only `null` (not `0` or `""`)                        | Explicit `!== null`       | `if (name !== null)`                    |
| Need custom narrow logic across files                                | Custom `is` guard         | `function isUser(x): x is User`          |
| Multiple related shapes you need to distinguish                      | Discriminated union       | `switch (res.kind)`                      |
| API response that is either `Success` or `Failure`                   | Discriminated union       | `{ status: "ok" } \| { status: "error" }`|
| Validating form input (string \| null)                               | Truthiness + length check | `if (!input) return "required"`          |
| Validating data from `JSON.parse` (unknown)                          | Custom `is` guard         | type guard before use                    |
| Handling all branches of a union safely                              | Exhaustive check + `never` | `const _: never = shape`                |

---

## Running the examples

From this folder:

```bash
npx ts-node "narrowing.ts"
```
