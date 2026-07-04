# Built-in / Primitive Types in TypeScript

A reference for TypeScript's primitive types and the special types that
support its type system. Read this alongside [`index.ts`](./index.ts), which
contains runnable examples of everything described here.

---

## Table of Contents

1. [What is a primitive type?](#what-is-a-primitive-type)
2. [The seven primitives](#the-seven-primitives)
   - [number](#number)
   - [string](#string)
   - [boolean](#boolean)
   - [null](#null)
   - [undefined](#undefined)
   - [symbol](#symbol)
   - [bigint](#bigint)
3. [Special types](#special-types)
   - [any](#any)
   - [unknown](#unknown)
   - [void](#void)
   - [never](#never)
4. [any vs unknown](#any-vs-unknown)
5. [Why never matters](#why-never-matters)
6. [Quick reference table](#quick-reference-table)
7. [Running the examples](#running-the-examples)

---

## What is a primitive type?

A primitive is a basic value that is **not an object** and has **no methods of
its own** (the methods you can call on them, like `"abc".toUpperCase()`, come
from temporary wrapper objects). Primitives are immutable and are compared by
value.

TypeScript has seven primitive types: `number`, `string`, `boolean`, `null`,
`undefined`, `symbol`, and `bigint`. Everything else (arrays, objects,
functions) is a non-primitive / reference type.

---

## The seven primitives

### number

Represents all numeric values. Unlike languages such as C or Java, TypeScript
does **not** separate `int`, `float`, and `double` — there is one `number` type
for integers, decimals, and negatives.

```ts
let age: number = 25;
let price: number = 9.99;
let temp: number = -10;
```

### string

Represents text. There is no separate `char` type — a single character is just
a string of length one. Supports single quotes, double quotes, and template
literals (backticks) for interpolation.

```ts
let letter: string = 'A';
let userName: string = "John";
let msg: string = `Hello ${userName}, welcome to TypeScript!`;
```

### boolean

Holds only `true` or `false`.

```ts
let isLoggedIn: boolean = true;
```

### null

Represents an intentional absence of value — something you deliberately set to
"empty". It is commonly used in a union with another type.

```ts
let user: string | null = null;
```

### undefined

Represents a variable that has been declared but not yet assigned a value.

```ts
let score: number | undefined;
let u: undefined = undefined;
```

> **null vs undefined:** `undefined` usually means "not assigned yet" (the
> default), while `null` means "explicitly set to nothing". With `strictNullChecks`
> enabled, neither can be assigned to other types unless you use a union.

### symbol

A unique and immutable identifier. Every call to `Symbol()` produces a brand new
value, even if the description is identical. Mostly used for advanced patterns
such as unique object keys.

```ts
const id = Symbol("id");
const id2 = Symbol("id");
// id === id2 -> false, always unique
```

### bigint

For integers larger than `number` can safely represent (beyond 2^53 − 1).
Written with an `n` suffix.

```ts
let bigNum: bigint = 9007199254740991n;
```

> **Note:** `bigint` literals require a compiler `target` of `ES2020` or higher.
> See [Running the examples](#running-the-examples).

---

## Special types

These are not primitives, but they are essential to how TypeScript's type system
works.

### any

Turns **off** type checking for a value. It can hold anything and you can do
anything with it, which makes it convenient but unsafe — mistakes are not caught
until runtime. Use it sparingly.

```ts
let x: any = 5;
x = "hello"; // OK
x = true;    // OK
x.fly();     // No compile error, but crashes at runtime
```

### unknown

The type-safe counterpart of `any`. A value of type `unknown` can hold anything,
but you cannot use it until you **narrow** it to a specific type first.

```ts
let input: unknown = "hello";
// input.toUpperCase();          // Error: must check the type first
if (typeof input === "string") {
    input.toUpperCase();         // OK: TypeScript now knows it is a string
}
```

### void

Used for functions that do not return a value.

```ts
function display(): void {
    console.log("nothing returned");
}
```

### never

Represents a value that **never occurs**. It marks code paths that should never
be reached. The three common uses are:

```ts
// 1. A function that always throws
function throwError(msg: string): never {
    throw new Error(msg);
}

// 2. A function that never finishes
function runForever(): never {
    while (true) {}
}

// 3. Exhaustiveness checks (see below)
```

---

## any vs unknown

Both can hold any value, but they differ in safety. Prefer `unknown` whenever
you receive data of an uncertain shape (API responses, user input), and narrow
it before use.

| Behavior                         | `any`              | `unknown`                  |
| -------------------------------- | ------------------ | -------------------------- |
| Can hold any value               | Yes                | Yes                        |
| Use directly without checks      | Yes (unsafe)       | No (must narrow first)     |
| Catches mistakes at compile time | No                 | Yes                        |
| Recommended                      | Rarely             | When the type is unknown   |

```ts
let a: any = "hello";
a.fly();   // No error, crashes at runtime

let b: unknown = "hello";
// b.fly(); // Error, caught at compile time
```

---

## Why never matters

A natural question: why not just return a string message instead of using
`never`? Because lying about the return type causes silent bugs.

```ts
// Wrong: claims to return a string, but actually throws
function throwError(msg: string): string {
    throw new Error(msg);
    return "never reaches here"; // fake return you are forced to add
}

let name: string = throwError("boom");
// TypeScript thinks `name` is a valid string, but the function threw.
```

With `never`, TypeScript understands that execution stops, so it reasons about
the surrounding code correctly:

```ts
function throwError(msg: string): never {
    throw new Error(msg);
}

function getUser(id: number): string {
    if (id <= 0) {
        throwError("Invalid ID"); // TypeScript knows execution stops here
    }
    return "John"; // reached only when id > 0
}
```

`never` also powers **exhaustiveness checks**. Assigning the remaining value to a
`never` variable forces a compile error if you ever add a new case to a union
and forget to handle it:

```ts
type Shape = "circle" | "square" | "triangle";

function getArea(shape: Shape) {
    if (shape === "circle") return "circle area";
    else if (shape === "square") return "square area";
    else if (shape === "triangle") return "triangle area";
    else {
        const exhaustiveCheck: never = shape; // Error if a case is missed
        return exhaustiveCheck;
    }
}
```

---

## Quick reference table

| Type        | Category  | Example value            | Notes                                   |
| ----------- | --------- | ------------------------ | --------------------------------------- |
| `number`    | primitive | `25`, `9.99`, `-10`      | One type for all numbers                |
| `string`    | primitive | `"John"`, `` `hi ${x}` `` | No separate char type                   |
| `boolean`   | primitive | `true`, `false`          | Only two values                         |
| `null`      | primitive | `null`                   | Intentional empty value                 |
| `undefined` | primitive | `undefined`              | Declared but not assigned               |
| `symbol`    | primitive | `Symbol("id")`           | Always unique                           |
| `bigint`    | primitive | `9007199254740991n`      | Needs target ES2020+                     |
| `any`       | special   | anything                 | Disables type checking, unsafe          |
| `unknown`   | special   | anything                 | Safe `any`, must narrow before use      |
| `void`      | special   | `undefined`              | Function returns nothing                |
| `never`     | special   | (no value)               | Code that never completes / is reached  |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                          | Use this        | Example                                  |
| ----------------------------------------------------------------------- | --------------- | ---------------------------------------- |
| Whole numbers, decimals, prices, ages                                   | `number`        | `let age: number = 25`                   |
| Names, messages, labels, any text                                       | `string`        | `let name: string = "Sakif"`             |
| Yes/no, on/off, true/false flags                                        | `boolean`       | `let active: boolean = true`             |
| A value you intentionally set to "empty"                                | `null`          | `let user: User \| null = null`          |
| A variable declared but not yet assigned                                | `undefined`     | `let val: number \| undefined`           |
| Unique object key that must never clash                                 | `symbol`        | `const id = Symbol("id")`                |
| Numbers larger than `Number.MAX_SAFE_INTEGER` (2^53)                    | `bigint`        | `let huge: bigint = 9999999999999999n`   |
| Function that doesn't return anything (e.g. `console.log` wrapper)      | `void`          | `function log(): void`                   |
| Function that always throws or runs forever                             | `never`         | `function fail(): never { throw ... }`   |
| Data from an API where you don't know the shape yet                     | `unknown`       | `const data: unknown = await res.json()` |
| Quickly migrating JS to TS, no time to type properly                    | `any` (last resort) | `let legacy: any = oldCode()`        |
| Exhaustive switch — making sure all union cases are handled             | `never` check   | `const _: never = shape`                 |

---

## Running the examples

From this folder, compile and run [`index.ts`](./index.ts):

```bash
# One-off run without compiling to disk
npx ts-node "index.ts"

# Or compile then run
npx tsc "index.ts" --target ES2020
node "index.js"
```

The `--target ES2020` flag is required because the file uses a `bigint` literal.
If you compile through a `tsconfig.json` instead, set:

```json
{
  "compilerOptions": {
    "target": "ES2020"
  }
}
```
