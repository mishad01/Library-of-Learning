# TypeScript Array Types

A focused guide to declaring and working with arrays in TypeScript. This document pairs with [array-type.ts](array-type.ts) — read them side by side.

---

## Table of Contents

1. [Declaring a typed array](#1-declaring-a-typed-array)
2. [Two syntaxes: `T[]` vs `Array<T>`](#2-two-syntaxes-t-vs-arrayt)
3. [What is a generic?](#3-what-is-a-generic)
4. [Union of array types: `string[] | number[]`](#4-union-of-array-types-string--number)
5. [Array of a union type: `(string | number)[]`](#5-array-of-a-union-type-string--number)
6. [The key difference (the part everyone confuses)](#6-the-key-difference-the-part-everyone-confuses)
7. [Readonly arrays](#7-readonly-arrays)
8. [Multidimensional arrays](#8-multidimensional-arrays)
9. [Array methods and type inference](#9-array-methods-and-type-inference)
10. [Quick reference](#10-quick-reference)

---

## 1. Declaring a typed array

An array type tells TypeScript what kind of values the array is allowed to hold.

```typescript
let testArray: number[];
testArray = [1, 2, 3]; // OK
testArray = [1, "a"];  // ERROR - "a" is not a number
```

If you assign a value of the wrong type, TypeScript reports an error before the code ever runs.

---

## 2. Two syntaxes: `T[]` vs `Array<T>`

There are two ways to write an array type. They are **completely identical** in meaning.

```typescript
let a: string[];        // shorthand syntax
let b: Array<string>;   // generic syntax
```

| Syntax        | Example          | Notes                                        |
| ------------- | ---------------- | -------------------------------------------- |
| Shorthand     | `string[]`       | Most common; preferred for simple types      |
| Generic       | `Array<string>`  | Clearer for complex/nested generics          |

Recommendation: use the shorthand `T[]` by default and stay consistent across your codebase.

---

## 3. What is a generic?

A **generic** is a type that takes another type as a parameter — like a function that takes an argument, but for types instead of values. The angle brackets `<...>` are where you pass that type in.

```typescript
Array<string>
//    ^^^^^^ the type argument you pass in
// ^^^^^ the generic type
```

`Array` on its own is incomplete — "an array of *what*?" You fill in the blank by passing a type inside `<>`:

```typescript
Array<string>   // an array of strings
Array<number>   // an array of numbers
Array<boolean>  // an array of booleans
```

That fill-in-the-blank slot is why it is called the "generic syntax": `Array` is a **generic type**, and `<string>` is the argument you give it.

### The mental model

Think of a generic as a template with a blank to fill in:

```
A box of ____        ->  Box<T>
A box of apples      ->  Box<Apple>
A box of books       ->  Box<Book>
```

The box works the same way regardless of what is inside — only the *content type* changes. `Array<T>` is the same idea: the array behaves identically whether it holds strings or numbers; only `T` changes.

This is also why `string[]` and `Array<string>` are identical — the shorthand is just sugar for the built-in `Array` generic:

```typescript
let a: Array<string>; // generic syntax (the underlying form)
let b: string[];      // shorthand (sugar for the same thing)
```

### Generics are not only for arrays

The reason this matters: many built-in types are generic, so you will see `<>` everywhere.

```typescript
Array<number>          // array of numbers
Promise<string>        // a promise that resolves to a string
Map<string, number>    // a map with string keys and number values
Set<boolean>           // a set of booleans
```

`Map` even takes **two** type arguments — `Map<KeyType, ValueType>` — which the shorthand cannot express. That is a case where the generic syntax is the only option.

You can also write your own generic functions and types later (for example `function first<T>(arr: T[]): T`), but the core idea never changes: **a type with a fill-in-the-blank slot, and `<>` is where you fill it.**

---

## 4. Union of array types: `string[] | number[]`

```typescript
let singleTypeArray: string[] | number[];
```

This reads as `(string[]) | (number[])` because `[]` binds before `|`.

Meaning: the variable is **either a whole array of strings OR a whole array of numbers**. You cannot mix element types inside one array.

```typescript
singleTypeArray = ["a", "b", "c"]; // OK - it is the string[] option
singleTypeArray = [1, 2, 3];       // OK - it is the number[] option
singleTypeArray = ["a", 1];        // ERROR - neither a pure string[] nor a pure number[]
```

The choice between string or number is made **once, at the array level**.

> Caveat: because the type is a union, you can only call methods that are valid for *both* options without first narrowing the type. For example, `singleTypeArray.sort((a, b) => a - b)` will not type-check directly, since subtraction is not valid when the array might be `string[]`.

---

## 5. Array of a union type: `(string | number)[]`

```typescript
let multipleType: (string | number)[];
```

The parentheses force the union to be evaluated first, then `[]` wraps the result.

Meaning: a **single array where each element can independently be a string or a number**. Mixing is allowed.

```typescript
multipleType = ["a", "b", "c"];  // OK
multipleType = [1, 2, 3];        // OK
multipleType = ["a", 1, "b", 2]; // OK - mixed allowed
```

The choice between string or number is made **per element, every time**.

---

## 6. The key difference (the part everyone confuses)

The position of `[]` relative to the parentheses changes the whole meaning. Think of `|` as "a choice" and ask **where the choice happens**.

```typescript
string[] | number[]      // choose the WHOLE array's type once
(string | number)[]      // choose each ELEMENT's type independently
```

It works exactly like parentheses in math:

```
2 * 3 + 4    is different from    2 * (3 + 4)
```

The parentheses change what the operation applies to. Here they change what `[]` applies to.

| Type                  | Same as            | What it allows                                 |
| --------------------- | ------------------ | ---------------------------------------------- |
| `string[] \| number[]` | `(string[]) \| (number[])` | one all-string array OR one all-number array  |
| `(string \| number)[]` | array of a union   | one array, each item is a string or a number   |

```typescript
let a: string[] | number[];
a = [1, "a"]; // ERROR

let b: (string | number)[];
b = [1, "a"]; // OK
```

---

## 7. Readonly arrays

A `readonly` array cannot be modified after it is created. Mutating methods like `push`, `pop`, and `splice` are removed from its type.

```typescript
const nums: readonly number[] = [1, 2, 3];
nums.push(4);  // ERROR - push does not exist on a readonly array
nums[0] = 99;  // ERROR - index assignment not allowed
```

Use this when you want to guarantee a list is never changed.

---

## 8. Multidimensional arrays

Stack `[]` to nest arrays. `number[][]` means "an array of arrays of numbers".

```typescript
let matrix: number[][] = [
  [1, 2, 3],
  [4, 5, 6],
];

console.log(matrix[0][2]); // 3  -> row 0, column 2
```

---

## 9. Array methods and type inference

TypeScript infers the result type of common array methods automatically, so you usually do not need to annotate them.

```typescript
const nums: number[] = [1, 2, 3, 4, 5];

const doubled = nums.map((n) => n * 2);          // inferred: number[]
const evens = nums.filter((n) => n % 2 === 0);   // inferred: number[]
const sum = nums.reduce((acc, n) => acc + n, 0); // inferred: number
```

- `map` transforms each element and returns a new array.
- `filter` keeps only elements that pass a test.
- `reduce` collapses the array into a single value (the `0` is the starting value).

---

## 10. Quick reference

| Goal                                         | Type                    |
| -------------------------------------------- | ----------------------- |
| Array of strings                             | `string[]`              |
| Array of numbers (generic form)              | `Array<number>`         |
| Either an all-string OR all-number array     | `string[] \| number[]`  |
| One array mixing strings and numbers         | `(string \| number)[]`  |
| Array that cannot be modified                | `readonly number[]`     |
| 2D grid of numbers                           | `number[][]`            |

---

## How to run

```bash
npx ts-node "array-type.ts"
```

Or compile then run:

```bash
tsc "array-type.ts"
node "array-type.js"
```
