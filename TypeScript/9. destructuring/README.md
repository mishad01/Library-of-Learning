# Destructuring in TypeScript

Destructuring is a short way to take values out of objects and arrays and
put them into variables. You will see this pattern in almost every React,
React Native, and modern JavaScript file. Read this alongside the example
files in this folder.

---

## Table of Contents

1. [What is destructuring?](#what-is-destructuring)
2. [Object destructuring](#object-destructuring)
3. [Array destructuring](#array-destructuring)
4. [Default values](#default-values)
5. [Renaming variables](#renaming-variables)
6. [Destructuring in function parameters](#destructuring-in-function-parameters)
7. [Nested destructuring](#nested-destructuring)
8. [Real world examples](#real-world-examples)
9. [Quick reference table](#quick-reference-table)

---

## What is destructuring?

Before destructuring, you had to write code like this:

```ts
const user = { name: "Sakif", age: 25 };
const name = user.name;
const age = user.age;
```

With destructuring, you can do it in one line:

```ts
const { name, age } = user;
```

It is just a shortcut. The variable names on the left must match the keys
on the right.

---

## Object destructuring

You take values out of an object using `{ }`.

```ts
const user = { name: "Sakif", age: 25, city: "Dhaka" };
const { name, age } = user;

console.log(name); // "Sakif"
console.log(age);  // 25
```

You can pick only the keys you need. The rest are ignored.

---

## Array destructuring

You take values out of an array using `[ ]`. Here, **position matters** —
not names.

```ts
const colors = ["red", "green", "blue"];
const [first, second, third] = colors;

console.log(first);  // "red"
console.log(second); // "green"
console.log(third);  // "blue"
```

You can skip items with a comma:

```ts
const [, , third] = colors;
console.log(third); // "blue"
```

---

## Default values

If a value is `undefined`, you can give a default.

```ts
const { name, role = "user" } = { name: "Sakif" };
console.log(role); // "user" — used because role was missing
```

Same for arrays:

```ts
const [a = 10, b = 20] = [5];
console.log(a); // 5
console.log(b); // 20
```

---

## Renaming variables

Sometimes the key name is not what you want. You can rename it with `:`.

```ts
const user = { name: "Sakif", age: 25 };
const { name: fullName, age: years } = user;

console.log(fullName); // "Sakif"
console.log(years);    // 25
```

This is useful when two objects have the same key but you want different
variable names.

---

## Destructuring in function parameters

This is very common. You can destructure right inside the parameter list.

```ts
type User = { name: string; age: number };

function greet({ name, age }: User) {
    console.log(`Hello ${name}, you are ${age} years old.`);
}

greet({ name: "Sakif", age: 25 });
```

Without destructuring you would write `user.name` and `user.age` inside
the function — destructuring is cleaner.

---

## Nested destructuring

You can destructure objects inside objects.

```ts
const user = {
    name: "Sakif",
    address: {
        city: "Dhaka",
        country: "Bangladesh",
    },
};

const { name, address: { city, country } } = user;
console.log(city);    // "Dhaka"
console.log(country); // "Bangladesh"
```

---

## Real world examples

**React Native `useState`:**

```ts
const [count, setCount] = useState<number>(0);
// count   -> the current value
// setCount -> the function to update it
```

`useState` returns an array of two items. Array destructuring lets you
name them anything you want.

**React Navigation `useRoute`:**

```ts
const { name, params } = useRoute();
```

**Redux `useSelector`:**

```ts
const totalLikes = useSelector(
    (state: RootState) => state.dataReducer.totalLike
);
```

Here, the callback's parameter `state` is typed with `RootState`. You
will see this pattern everywhere in Redux Toolkit code.

**Props in a component:**

```ts
type Props = { title: string; onPress: () => void };

function Button({ title, onPress }: Props) {
    return <button onClick={onPress}>{title}</button>;
}
```

---

## Quick reference table

| Pattern                       | Example                            | Use                              |
| ----------------------------- | ---------------------------------- | -------------------------------- |
| Object destructuring          | `const { a, b } = obj`             | Pick keys from an object         |
| Array destructuring           | `const [x, y] = arr`               | Pick items from an array by index |
| Default value                 | `const { a = 1 } = obj`            | Use a fallback if undefined      |
| Rename                        | `const { a: x } = obj`             | Give a new variable name         |
| Function parameter            | `function f({ a, b }: T)`          | Destructure inside parameters    |
| Nested                        | `const { a: { b } } = obj`         | Reach into inner objects         |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                             | Pattern to use            | Example                                              |
| -------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------- |
| Pulling a few fields out of an API response or props object                | Object destructuring      | `const { id, name } = response.data`                 |
| Working with React `useState` (always returns `[value, setter]`)           | Array destructuring       | `const [count, setCount] = useState(0)`              |
| Reading route params in React Navigation                                   | Object destructuring      | `const { params } = useRoute()`                      |
| Receiving props in a functional component                                  | Param destructuring       | `function Button({ title, onPress }: Props) { ... }` |
| The key name from the API is bad / clashes with another variable          | Renaming                  | `const { name: userName } = user`                    |
| The value might be missing and you want a fallback                         | Default value             | `const { role = "guest" } = user`                    |
| Accessing deeply nested fields (`user.address.city`) in one go             | Nested destructuring      | `const { address: { city } } = user`                 |
| Skipping the first few items of an array and only needing later ones       | Array with empty slots    | `const [, , third] = colors`                         |
| Collecting "the rest" of an object / array into a single variable          | Rest pattern              | `const { id, ...others } = user`                     |
| Returning multiple values from a function (like coordinates `[x, y]`)      | Array destructuring       | `const [x, y] = getPosition()`                       |
| Cleaner function signatures with many optional fields                      | Object param destructuring| `function create({ name, age = 18 }: User) { ... }`  |

---

## Running the examples

From this folder:

```bash
npx ts-node "object-destructuring.ts"
npx ts-node "array-destructuring.ts"
```
