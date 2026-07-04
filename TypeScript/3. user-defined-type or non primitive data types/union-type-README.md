# Union Types in TypeScript

## What is a Union Type?

A union type allows a variable or parameter to hold **more than one type**.

```ts
let userId: string | number;
userId = "abc123"; // ✅
userId = 101;      // ✅
```

---

## Union with more than 2 types

```ts
let input: string | number | boolean;
input = "hello"; // ✅
input = 42;      // ✅
input = true;    // ✅
```

---

## Literal Types

A **literal type** means the variable can only hold **that exact value**, not just that type.

**Normal type — any string allowed:**
```ts
let direction: string = "left";
direction = "anything"; // ✅ allowed
```

**Literal type — only THESE specific values allowed:**
```ts
type Direction = "left" | "right" | "up" | "down";
let move: Direction = "left"; // ✅
// move = "diagonal";         // ❌ Error
```

Works with numbers too:
```ts
type StatusCode = 200 | 404 | 500;
let code: StatusCode = 200; // ✅
// code = 999;              // ❌ Error
```

Real world use case — catches invalid values at compile time:
```ts
type Status = "pending" | "approved" | "rejected";

function updateStatus(status: Status) {
    console.log("Status updated to:", status);
}

updateStatus("approved"); // ✅
// updateStatus("maybe"); // ❌ Error
```

---

## Union in Return Type

```ts
function parse(input: string): number | null {
    const result = Number(input);
    return isNaN(result) ? null : result;
}

console.log(parse("42"));  // 42
console.log(parse("abc")); // null
```

---

## Union with Object Types

```ts
type Dog = { breed: string };
type Cat = { lives: number };

let pet: Dog | Cat = { breed: "Labrador" };
```

**Problem — TypeScript doesn't know which one it is:**
```ts
console.log(pet.breed); // ❌ Error — what if pet is a Cat?
console.log(pet.lives); // ❌ Error — what if pet is a Dog?
```

**Solution — narrow using the `in` operator:**
```ts
if ("breed" in pet) {
    // TypeScript knows: this must be a Dog
    console.log(pet.breed); // ✅
} else {
    // TypeScript knows: this must be a Cat
    console.log(pet.lives); // ✅
}
```

The `in` operator checks if a property exists on the object. TypeScript uses this to narrow the type.

---

## Type Narrowing Summary

| Method | Example | Use when |
|---|---|---|
| `typeof` | `typeof x === "string"` | Primitive types |
| `in` | `"breed" in pet` | Object types |

---

## Key Takeaways

- `string | number` = can be either type
- Literal types = only exact values allowed — great for catching bugs at compile time
- With object unions, TypeScript forces you to **narrow** before accessing properties
- `typeof` narrows primitives, `in` narrows objects

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Variable that can hold an ID as either a number or string            | Basic union               | `let id: number \| string`               |
| Function param that accepts either a string or a number              | Union param               | `function fn(x: string \| number)`       |
| Function may return a value or `null` when not found                 | Union with `null`         | `function find(): User \| null`          |
| Restricting a value to fixed strings ("light" / "dark")              | String literal union      | `type Theme = "light" \| "dark"`         |
| HTTP status codes, fixed numbers only                                | Numeric literal union     | `type Status = 200 \| 404 \| 500`        |
| Component prop that should only accept "primary" or "secondary"      | Literal union             | `variant: "primary" \| "secondary"`      |
| API response is either a success or error shape                      | Union of object types     | `Success \| Error`                       |
| Checking which shape a union object actually is                      | `in` operator narrowing   | `if ("breed" in pet) { ... }`            |
| Narrowing a primitive union before using it                          | `typeof` narrowing        | `if (typeof x === "string") {}`          |
| Adding a discriminator field for safer narrowing                     | Discriminated union       | `type T = { kind: "a" } \| { kind: "b" }`|
| You want BOTH types' fields combined (not either/or)                 | Intersection `&`          | `Admin & Employee`                       |
