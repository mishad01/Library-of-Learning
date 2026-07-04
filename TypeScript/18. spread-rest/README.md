# Spread and Rest Operators in TypeScript

The spread (`...`) and rest (`...`) operators **look the same** but do
**opposite things**. Spread takes things apart and puts them somewhere
else. Rest collects many things into one place. Once you understand the
context, it becomes simple.

---

## Table of Contents

1. [Spread vs Rest — the simple rule](#spread-vs-rest--the-simple-rule)
2. [Spread with arrays](#spread-with-arrays)
3. [Spread with objects](#spread-with-objects)
4. [Spread with function calls](#spread-with-function-calls)
5. [Rest in function parameters](#rest-in-function-parameters)
6. [Rest in destructuring](#rest-in-destructuring)
7. [Spread, immutability, and React state](#spread-immutability-and-react-state)
8. [Shallow vs deep copy](#shallow-vs-deep-copy)
9. [Real world examples](#real-world-examples)
10. [Quick reference table](#quick-reference-table)

---

## Spread vs Rest — the simple rule

Both use the `...` symbol.

- **Spread** — used on the **right** side, or inside an array/object/call.
  It **expands** things.
- **Rest** — used on the **left** side (in parameters or destructuring).
  It **gathers** things.

```ts
// SPREAD — expands the array into the function call
const nums = [1, 2, 3];
Math.max(...nums); // same as Math.max(1, 2, 3)

// REST — collects many arguments into one array
function sum(...nums: number[]) {
    return nums.reduce((a, b) => a + b, 0);
}
sum(1, 2, 3); // nums = [1, 2, 3]
```

---

## Spread with arrays

Copy or combine arrays.

```ts
const a = [1, 2];
const b = [3, 4];

const copy = [...a];          // [1, 2]
const merged = [...a, ...b];  // [1, 2, 3, 4]
const added = [0, ...a, 99];  // [0, 1, 2, 99]
```

---

## Spread with objects

Copy or combine objects. Later keys **overwrite** earlier ones.

```ts
const user = { name: "Sakif", age: 25 };

const copy = { ...user };

const updated = { ...user, age: 26 };
// { name: "Sakif", age: 26 }

const merged = { ...user, ...{ city: "Dhaka" } };
// { name: "Sakif", age: 25, city: "Dhaka" }
```

---

## Spread with function calls

Pass array items as separate arguments.

```ts
function greet(a: string, b: string, c: string) {
    console.log(a, b, c);
}

const args: [string, string, string] = ["hi", "hello", "hey"];
greet(...args);
```

> Tip: Tuple types (`[string, string, string]`) work well with spread
> in calls.

---

## Rest in function parameters

Collect any number of arguments into an array.

```ts
function sum(...nums: number[]): number {
    return nums.reduce((a, b) => a + b, 0);
}

sum(1, 2, 3);     // 6
sum(1, 2, 3, 4);  // 10
```

You can mix normal parameters with rest, but rest must be **last**.

```ts
function logAll(prefix: string, ...items: string[]) {
    items.forEach((i) => console.log(prefix, i));
}

logAll(">>", "a", "b", "c");
```

---

## Rest in destructuring

Collect the leftover values.

**Array:**

```ts
const [first, ...others] = [1, 2, 3, 4];
console.log(first);  // 1
console.log(others); // [2, 3, 4]
```

**Object:**

```ts
const user = { id: 1, name: "Sakif", age: 25 };
const { id, ...rest } = user;
console.log(id);   // 1
console.log(rest); // { name: "Sakif", age: 25 }
```

This is very common for removing a field cleanly.

---

## Spread, immutability, and React state

In React you never change state directly. Instead, you make a new
object/array with the change. Spread makes this easy.

```ts
// Adding to a list
setItems([...items, newItem]);

// Removing one item
setItems(items.filter((i) => i.id !== id));

// Updating one field in an object
setUser({ ...user, name: "Ali" });
```

---

## Shallow vs deep copy

Spread only makes a **shallow** copy. Nested objects are still shared.

```ts
const user = { name: "Sakif", address: { city: "Dhaka" } };
const copy = { ...user };

copy.address.city = "Chittagong";
console.log(user.address.city); // "Chittagong" — also changed!
```

For deep copies, you need a separate technique (e.g.,
`structuredClone(user)` or a library like `lodash.cloneDeep`).

```ts
const deep = structuredClone(user);
```

---

## Real world examples

**Updating Redux state:**

```ts
case "UPDATE_NAME":
    return { ...state, name: action.payload };
```

**Adding default props:**

```ts
const defaults = { theme: "light", lang: "en" };
const finalConfig = { ...defaults, ...userConfig };
```

**Removing a field from an object:**

```ts
const { password, ...safeUser } = user;
return safeUser;
```

**Forwarding props in React:**

```tsx
function Wrapper(props: Props) {
    return <Button {...props} />;
}
```

---

## Quick reference table

| Pattern                                | Name    | Use                            |
| -------------------------------------- | ------- | ------------------------------ |
| `[...arr]`                             | Spread  | Copy / combine arrays          |
| `{ ...obj }`                           | Spread  | Copy / combine objects         |
| `fn(...arr)`                           | Spread  | Pass array as arguments        |
| `function fn(...args: number[])`       | Rest    | Collect arguments              |
| `const [a, ...rest] = arr`             | Rest    | Collect leftover array items   |
| `const { a, ...rest } = obj`           | Rest    | Collect leftover object props  |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Copy an array (don't mutate original)                                | Spread `[...arr]`         | `const copy = [...arr]`                  |
| Merge two arrays                                                     | Spread `[...a, ...b]`     | `[...prev, ...next]`                     |
| Add item to end (React state update)                                 | Spread + new item         | `setItems([...items, newItem])`          |
| Update one field in an object (React/Redux)                          | Object spread             | `{ ...user, name: "Ali" }`               |
| Merge default config + user config                                   | Object spread             | `{ ...defaults, ...userCfg }`            |
| Pass array contents as function arguments                            | Spread call               | `Math.max(...nums)`                      |
| Function accepts variable args (`sum(1,2,3)`)                        | Rest param                | `function sum(...nums: number[])`        |
| Get first item + everything else                                     | Array rest destructure    | `const [first, ...rest] = arr`           |
| Remove a key from object (e.g. strip `password`)                     | Object rest destructure   | `const { password, ...safe } = user`     |
| Forwarding props to a child component                                | JSX spread                | `<Button {...props} />`                  |
| Combining tuple values                                               | Spread                    | `[...point1, ...point2]`                 |
| Need a TRUE deep copy (nested objects)                               | `structuredClone`         | `structuredClone(user)`                  |
| Shallow copy isn't enough (need nested)                              | Lodash `cloneDeep`        | `_.cloneDeep(obj)`                       |
| Optional params: pre-args + tail collected                           | Rest after fixed param    | `function f(prefix, ...items)`           |

---

## Running the examples

From this folder:

```bash
npx ts-node "spread-rest.ts"
```
