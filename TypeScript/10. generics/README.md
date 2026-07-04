# Generics in TypeScript

Generics let you write code that works with **many types**, but still keeps
type safety. You write the code once and reuse it for different types.
This is one of the most powerful features of TypeScript, and you will use
it every day in React, React Native, and any modern app.

---

## Table of Contents

1. [Why do we need generics?](#why-do-we-need-generics)
2. [Generic functions](#generic-functions)
3. [Generic with multiple types](#generic-with-multiple-types)
4. [Generic arrays](#generic-arrays)
5. [Generic interfaces and types](#generic-interfaces-and-types)
6. [Generic classes](#generic-classes)
7. [Generic constraints (`extends`)](#generic-constraints-extends)
8. [Default generic types](#default-generic-types)
9. [Real world examples](#real-world-examples)
10. [Quick reference table](#quick-reference-table)

---

## Why do we need generics?

Look at this function. It returns whatever you give it.

```ts
function identity(value: any): any {
    return value;
}

const a = identity("hello"); // a is `any` — we lost the type!
```

If you use `any`, the type is lost. TypeScript no longer knows that `a`
is a string. Now try with generics:

```ts
function identity<T>(value: T): T {
    return value;
}

const a = identity<string>("hello"); // a is `string`
const b = identity<number>(42);      // b is `number`
```

The `<T>` is a **type variable**. It is like a placeholder that gets
replaced with the actual type you pass in. `T` is just a name — you can
use any name, but `T` is the common choice.

---

## Generic functions

You can also let TypeScript guess the type (called **type inference**).

```ts
function identity<T>(value: T): T {
    return value;
}

const a = identity("hello"); // T is inferred as string
const b = identity(42);      // T is inferred as number
```

You usually do **not** need to write `<string>` if TypeScript can guess.

---

## Generic with multiple types

You can use more than one type variable. Common names: `T`, `U`, `K`, `V`.

```ts
function pair<T, U>(first: T, second: U): [T, U] {
    return [first, second];
}

const result = pair("age", 25); // [string, number]
```

---

## Generic arrays

You have already seen this in your array section:

```ts
let nums: Array<number> = [1, 2, 3];
let names: Array<string> = ["a", "b"];
```

`Array<T>` is a generic type. The `T` becomes `number` or `string`.

---

## Generic interfaces and types

You can make your own reusable shapes.

```ts
interface Box<T> {
    value: T;
}

const stringBox: Box<string> = { value: "hello" };
const numberBox: Box<number> = { value: 42 };
```

Same with `type`:

```ts
type ApiResponse<T> = {
    success: boolean;
    data: T;
};

const userResponse: ApiResponse<{ name: string }> = {
    success: true,
    data: { name: "Sakif" },
};
```

This is exactly how real APIs are typed.

---

## Generic classes

A class can also use generics.

```ts
class Storage<T> {
    private items: T[] = [];

    add(item: T): void {
        this.items.push(item);
    }

    getAll(): T[] {
        return this.items;
    }
}

const strStore = new Storage<string>();
strStore.add("apple");
strStore.add("banana");
// strStore.add(123); // Error: not a string

const numStore = new Storage<number>();
numStore.add(10);
```

The same class works for any type, but stays type-safe.

---

## Generic constraints (`extends`)

Sometimes you want to limit what `T` can be. Use `extends`.

```ts
function getLength<T extends { length: number }>(item: T): number {
    return item.length;
}

getLength("hello");      // OK — strings have length
getLength([1, 2, 3]);    // OK — arrays have length
// getLength(42);        // Error — numbers don't have length
```

Here, `T` must have a `length` property. Without `extends`, TypeScript
would not let you write `item.length`.

---

## Default generic types

You can give a default type, just like default function parameters.

```ts
interface ApiResponse<T = any> {
    success: boolean;
    data: T;
}

const res1: ApiResponse = { success: true, data: "anything" };
const res2: ApiResponse<string> = { success: true, data: "hello" };
```

---

## Real world examples

**React `useState`:**

```ts
const [name, setName] = useState<string>("Sakif");
const [count, setCount] = useState<number>(0);
const [user, setUser] = useState<User | null>(null);
```

`useState` is a generic function — `<string>` tells it what type the
state holds.

**Redux `useSelector`:**

```ts
const totalLikes = useSelector<RootState, number>(
    (state) => state.dataReducer.totalLike
);
```

**Promise:**

```ts
async function getUser(): Promise<User> {
    const res = await fetch("/api/user");
    return res.json();
}
```

`Promise<User>` says "this promise will give back a User".

**Array methods:**

```ts
const nums = [1, 2, 3];
const doubled = nums.map<number>((n) => n * 2);
```

---

## Quick reference table

| Pattern                        | Example                                 | Meaning                          |
| ------------------------------ | --------------------------------------- | -------------------------------- |
| Generic function               | `function f<T>(x: T): T`                | Function works with any type     |
| Multiple type variables        | `function f<T, U>(a: T, b: U)`          | More than one type variable      |
| Generic interface              | `interface Box<T> { value: T }`         | Reusable object shape            |
| Generic class                  | `class Storage<T> { ... }`              | Class that holds any type        |
| Constraint                     | `<T extends { length: number }>`        | Limit what T can be              |
| Default type                   | `<T = string>`                          | Use this type if none is given   |
| Inference                      | `identity("hi")`                        | TypeScript guesses T = string    |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| `useState` storing a known type                                      | Generic call              | `useState<string>("")`                   |
| API response wrapper that holds any shape                            | Generic interface         | `interface Res<T> { data: T }`           |
| Function that returns the same type it received                      | Generic function          | `function id<T>(x: T): T`                |
| Reusable data store (queue, cache) for any type                      | Generic class             | `class Store<T> { ... }`                 |
| Function works on anything with a `length` (string, array)           | Generic constraint        | `<T extends { length: number }>`         |
| Default type when caller doesn't specify                             | Default type param        | `<T = string>`                           |
| Promise that resolves with a specific shape                          | `Promise<T>`              | `Promise<User>`                          |
| `Array<T>` / `Map<K,V>` / `Set<T>`                                   | Built-in generics         | `Map<string, User>`                      |
| React/Redux `useSelector<RootState, ReturnType>`                     | Generic call              | `useSelector<RootState, number>(...)`    |
| Higher-order helper (filter, map) that preserves type                | Generic function          | `function pick<T, K extends keyof T>(...)` |
| You don't care about the type at all                                 | `any` (avoid) or `unknown`| (don't reach for generics here)          |
| One type depends on another type's key                               | `keyof T` + generic       | `<T, K extends keyof T>`                 |

---

## Running the examples

From this folder:

```bash
npx ts-node "generic-function.ts"
npx ts-node "generic-class.ts"
```
