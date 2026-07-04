# TypeScript Tuples

A focused guide to tuples — fixed-length arrays where each position has its own type. This document pairs with [tuple-type.ts](tuple-type.ts) — read them side by side.

---

## Table of Contents

1. [What is a tuple?](#1-what-is-a-tuple)
2. [Basic tuple](#2-basic-tuple)
3. [The `push()` limitation](#3-the-push-limitation)
4. [Named tuple elements](#4-named-tuple-elements)
5. [Readonly tuples](#5-readonly-tuples)
6. [Optional tuple elements](#6-optional-tuple-elements)
7. [Tuple destructuring](#7-tuple-destructuring)
8. [Tuple as a function return type](#8-tuple-as-a-function-return-type)
9. [Tuple vs array](#9-tuple-vs-array)
10. [Quick reference](#10-quick-reference)

---

## 1. What is a tuple?

A **tuple** is a special kind of array with two extra guarantees:

1. A **fixed number** of elements.
2. Each **position has its own type**, and the order is enforced.

A regular array like `string[]` is "any number of strings". A tuple like `[number, string]` is "exactly two elements: a number first, then a string".

```typescript
let user: [number, string];
user = [101, "sakif"]; // OK
```

Tuples are ideal when you have a small, ordered group of values that belong together — for example an `[id, name]` pair or a `[value, setter]` result.

---

## 2. Basic tuple

Each position is locked to a specific type, in order. Putting the types in the wrong order is an error.

```typescript
let users: [number, string];

users = [101, "sakif"];   // OK
users = ["sakif", 101];   // ERROR - position 0 must be number, position 1 must be string
```

Access elements by index, just like an array:

```typescript
console.log(users[0]); // 101    (typed as number)
console.log(users[1]); // "sakif" (typed as string)
```

---

## 3. The `push()` limitation

This is an important gotcha. TypeScript enforces the tuple's types and length when you **assign** it, but it does **not** stop `push()` from adding extra elements.

```typescript
let users: [number, string] = [101, "sakif"];

users.push(102, "anis"); // no error - but the tuple now has 4 elements!
```

This is a known limitation: `push` is still allowed because a tuple is built on top of a normal array. If you need true immutability and length safety, use a **readonly tuple** (next section).

---

## 4. Named tuple elements

You can label each position. The labels are purely for readability — behavior is identical — but they make the meaning obvious to anyone reading the type.

```typescript
let employee: [name: string, age: number] = ["Sakif", 25];

console.log(employee[0]); // "Sakif"
console.log(employee[1]); // 25
```

Compare `[string, number]` (what are these?) with `[name: string, age: number]` (clearly a name and an age).

---

## 5. Readonly tuples

A `readonly` tuple cannot be modified after creation. This also **fixes the `push()` problem** from section 3, because mutating methods are removed from its type.

```typescript
let point: readonly [number, number] = [10, 20];

point.push(30); // ERROR - cannot modify a readonly tuple
point[0] = 99;  // ERROR - cannot reassign elements
```

Use this for fixed values like coordinates that should never change.

---

## 6. Optional tuple elements

A trailing element marked with `?` may be present or omitted. Optional elements must come **last**.

```typescript
let user1: [number, string, string?] = [1, "Sakif"];                  // third element omitted - OK
let user2: [number, string, string?] = [2, "Anis", "anis@gmail.com"]; // third element present - OK
```

---

## 7. Tuple destructuring

Destructuring pulls each position into its own named variable. This is the most common and most readable way to use a tuple.

```typescript
let userData: [number, string] = [101, "Sakif"];

const [id, name] = userData;
console.log(id);   // 101
console.log(name); // "Sakif"
```

The names `id` and `name` are yours to choose — they map to positions 0 and 1 in order.

---

## 8. Tuple as a function return type

A very practical use: returning several related values at once without wrapping them in an object.

```typescript
function getUser(): [number, string] {
  return [101, "Sakif"];
}

const [userId, userName] = getUser();
console.log(userId);   // 101
console.log(userName); // "Sakif"
```

You have used this pattern already if you know React: `useState` returns a tuple `[value, setter]`, which is why you write `const [count, setCount] = useState(0)`.

---

## 9. Tuple vs array

They look similar but serve different purposes.

| Aspect          | Array (`string[]`)          | Tuple (`[number, string]`)        |
| --------------- | --------------------------- | --------------------------------- |
| Length          | Any number of elements      | Fixed number of elements          |
| Element types   | All the same type           | Each position has its own type    |
| Order meaning   | Order is just sequence      | Order is part of the type         |
| Typical use     | A list of similar things    | A small, ordered group of values  |

Rule of thumb: use an **array** for "many of the same thing", and a **tuple** for "a fixed set of different things in a known order".

---

## 10. Quick reference

| Goal                              | Syntax                                  |
| --------------------------------- | --------------------------------------- |
| Fixed pair of types               | `[number, string]`                      |
| Labelled positions                | `[name: string, age: number]`           |
| Cannot be modified                | `readonly [number, number]`             |
| Optional trailing element         | `[number, string, string?]`             |
| Unpack into variables             | `const [id, name] = tuple`              |
| Return multiple values            | `function f(): [number, string]`        |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                | Example                                  |
| -------------------------------------------------------------------- | ----------------------- | ---------------------------------------- |
| React `useState` return value `[value, setter]`                      | Tuple                   | `const [n, setN] = useState(0)`          |
| Returning a `[data, error]` pair from a function                     | Tuple                   | `function fetchUser(): [User?, Error?]`  |
| Geometric coordinates (x, y) or (lat, lng)                           | Readonly tuple          | `readonly [number, number]`              |
| Key-value pair when iterating `Object.entries()`                     | Tuple `[string, V]`     | `for (const [k, v] of entries) {}`       |
| Fixed CSV row with known column order                                | Named tuple             | `[id: number, name: string, age: number]`|
| Last element is optional (e.g. middle name)                          | Optional tuple element  | `[string, string, string?]`              |
| Need many elements all same type → use array, not tuple              | `T[]`                   | `string[]`                               |
| Don't want anyone to push or modify the tuple                        | `readonly` tuple        | `readonly [number, number]`              |
| You want to give meaningful labels to each position                  | Named tuple             | `[name: string, age: number]`            |
| Unpacking tuple contents into clean variable names                   | Destructuring           | `const [id, name] = tuple`               |

---

## How to run

```bash
npx ts-node "tuple-type.ts"
```

Or compile then run:

```bash
tsc "tuple-type.ts"
node "tuple-type.js"
```
