# Functions in TypeScript

## Method vs Function

**Method** — lives inside a class or object:
```ts
class Student {
    display(): void {   // method — no `function` keyword, no `const`
        console.log("hello");
    }
}
```

**Function** — standalone, at the top level of a file:
```ts
function add(a: number, b: number): number {
    return a + b;
}
```

You cannot write `display(): void {}` at the top level of a file — it's class/object syntax only.

---

## Arrow Functions

A function stored in a variable:

```ts
const greet = () => {
    console.log("hello");
};
greet();
```

**With type annotation on the variable:**
```ts
let userInfo: () => void;
userInfo = () => { console.log("hello"); };

let userInfo2: () => string;
userInfo2 = () => { return "hello"; };

let userInfo3: (x: string, y: number) => any;
userInfo3 = (x, y) => { return x + y; };
```

---

## Optional Parameters (`?`)

```ts
function displayUser(name: string, age?: number): void {
    if (age !== undefined) {
        console.log(`${name}, age: ${age}`);
    } else {
        console.log(`${name}, age: not provided`);
    }
}

displayUser("Sakif", 25); // Sakif, age: 25
displayUser("Mishad");    // Mishad, age: not provided
```

Optional parameters must come **after** required ones.

---

## Default Parameters

```ts
function greet(name: string, greeting: string = "Hello"): string {
    return `${greeting}, ${name}`;
}

console.log(greet("Sakif"));        // Hello, Sakif
console.log(greet("Sakif", "Hi")); // Hi, Sakif
```

---

## Rest Parameters

Accept any number of arguments as an array:

```ts
function sum(...nums: number[]): number {
    return nums.reduce((acc, n) => acc + n, 0);
}

console.log(sum(1, 2, 3));        // 6
console.log(sum(10, 20, 30, 40)); // 100
```

---

## Function Overloading

Same function name, different parameter types. The last signature is the actual implementation:

```ts
function format(value: string): string;
function format(value: number): string;
function format(value: any): string {
    return String(value);
}

console.log(format(123));     // "123"
console.log(format("hello")); // "hello"
```

---

## Higher-Order Functions

A function that takes another function as a parameter:

```ts
function applyOperation(
    a: number,
    b: number,
    operation: (x: number, y: number) => number
): number {
    return operation(a, b);
}

const multiply = (x: number, y: number): number => x * y;

console.log(applyOperation(5, 3, add));      // 8
console.log(applyOperation(5, 3, multiply)); // 15
```

---

## `never` Return Type

For functions that **never return** — they always throw or run forever:

```ts
function throwError(msg: string): never {
    throw new Error(msg);
}

function getUser(id: number): string {
    if (id <= 0) {
        throwError("Invalid ID"); // TypeScript knows: execution stops here
    }
    return "Sakif"; // TypeScript knows this is only reached if id > 0
}
```

---

## Summary

| Type | Syntax | Use when |
|---|---|---|
| Regular function | `function foo() {}` | General use, hoisted |
| Arrow function | `const foo = () => {}` | Callbacks, concise |
| Method | `foo() {}` inside a class | Class behavior |
| Optional param | `age?: number` | Caller can skip it |
| Default param | `age = 25` | Fallback value |
| Rest param | `...nums: number[]` | Unknown number of args |
| Overloading | Multiple signatures | Same name, different types |
| Higher-order | Takes a function as param | Callbacks, functional patterns |
| `never` | `: never` | Always throws or infinite loop |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Reusable top-level helper (utility)                                  | `function` declaration    | `function add(a,b) { return a + b }`     |
| Short callback inside `map`, `filter`, event handler                 | Arrow function            | `nums.map(n => n * 2)`                   |
| Behavior attached to a class instance                                | Method                    | `class User { display() {} }`            |
| Caller may or may not provide a value (e.g. middle name)             | Optional `?` param        | `function user(name, middle?)`           |
| Provide a fallback when value isn't given                            | Default param             | `function greet(name, msg = "Hi")`       |
| Accept variable number of arguments (Math.max-style)                 | Rest param `...`          | `function sum(...nums: number[])`        |
| Same function name, multiple type signatures                         | Overloading               | `format(value: string); format(value: number);` |
| Function that takes / returns another function                       | Higher-order function     | `(cb: (n:number) => boolean) => ...`     |
| Function that always throws / never completes                        | `never` return type       | `function fail(): never { throw ... }`   |
| No return value at all (just side effects)                           | `void` return type        | `function log(): void`                   |
| Need lexical `this` (e.g. inside class methods passed as callbacks)  | Arrow function            | `setTimeout(() => this.do(), 1000)`      |
| Component or hook in React (uses caller's `this`)                    | Function declaration / arrow | `function Component() { ... }`       |
| Strongly-typed callback parameter                                    | Function type annotation  | `cb: (n: number) => void`                |
