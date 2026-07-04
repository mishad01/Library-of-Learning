# Type Coercion & Equality in TypeScript

## `==` (Loose Equality)
It **converts types** before comparing (called type coercion):

```ts
5 == "5"          // true  — converts "5" to number, then compares
0 == false        // true  — converts false to 0
null == undefined // true
"" == false       // true  — both convert to 0
```

---

## `===` (Strict Equality)
It does **NOT convert types** — both value AND type must match:

```ts
5 === "5"         // false — number vs string
0 === false       // false — number vs boolean
5 === 5           // true
"hi" === "hi"     // true
null === undefined // false — different types
```

---

## Why TypeScript prefers `===`

In C, C++, Dart — variables are strictly typed, so `==` always compares the same type. No coercion happens.

In JavaScript/TypeScript — variables can hold any type, so `==` tries to be "helpful" by converting types automatically. This leads to **silent bugs**:

```ts
let userId = 0;
let isLoggedIn = false;

if (userId == isLoggedIn) {  // true — but this makes no sense!
    console.log("logged in"); // this runs — wrong behavior
}

if (userId === isLoggedIn) { // false — correctly catches the type mismatch
    console.log("logged in"); // this does not run — correct
}
```

---

## `!=` vs `!==`

Same rule applies for not-equal:

```ts
5 != "5"   // false — they are loosely equal, so not-equal is false
5 !== "5"  // true  — different types, so strictly not equal
```

---

## Rule

**Always use `===` and `!==` in TypeScript/JavaScript.**

The only exception some developers allow is `null == undefined` to catch both at once:
```ts
if (value == null) {
    // catches both null and undefined
}
```
But even then, being explicit with `=== null || === undefined` is clearer.

TypeScript's `strict` mode and most linters will warn you if you use `==`.

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                   | Use this              | Example                              |
| ---------------------------------------------------------------- | --------------------- | ------------------------------------ |
| Comparing two values of the same type (numbers, strings, etc.)   | `===`                 | `if (age === 18)`                    |
| Comparing two values you want to be NOT equal                    | `!==`                 | `if (status !== "done")`             |
| Checking if a value is `null` OR `undefined` in one shot         | `== null`             | `if (value == null)` (rare exception)|
| Checking only for `null`                                         | `=== null`            | `if (user === null)`                 |
| Checking only for `undefined`                                    | `=== undefined`       | `if (data === undefined)`            |
| Comparing user input from a form (string) with a number          | Convert first, then `===` | `Number(input) === 5`            |
| Default rule for ALL comparisons in TypeScript/JS                | Always `===` / `!==`  | `a === b`                            |
| Working in C, C++, Java, Dart                                    | `==` is fine          | (their types are strict)             |
