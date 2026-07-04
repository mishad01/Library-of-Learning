# `keyof` and `typeof` Operators in TypeScript

`keyof` and `typeof` are two powerful type operators. They let you
**get a type from another value or type**, so your code stays in sync
even when the data changes. They are the foundation for many advanced
patterns like utility types and mapped types.

---

## Table of Contents

1. [The `typeof` operator (in types)](#the-typeof-operator-in-types)
2. [The `keyof` operator](#the-keyof-operator)
3. [Combining `keyof` and `typeof`](#combining-keyof-and-typeof)
4. [Index access types (`T[K]`)](#index-access-types-tk)
5. [Generic functions with `keyof`](#generic-functions-with-keyof)
6. [`typeof` in expressions vs types](#typeof-in-expressions-vs-types)
7. [Real world examples](#real-world-examples)
8. [Quick reference table](#quick-reference-table)

---

## The `typeof` operator (in types)

In TypeScript, `typeof` can be used in **type positions** to get the
type of a value.

```ts
const user = { name: "Sakif", age: 25 };

type User = typeof user;
// { name: string; age: number }
```

You wrote `user` once. Now `User` follows it automatically. If you add
a field to `user`, `User` updates as well.

This is very useful for inferring types from constants or function
returns.

```ts
function getConfig() {
    return { theme: "dark", lang: "en" };
}

type Config = ReturnType<typeof getConfig>;
// { theme: string; lang: string }
```

---

## The `keyof` operator

`keyof` gives you a **union of all keys** of a type.

```ts
type User = { id: number; name: string; email: string };

type UserKeys = keyof User;
// "id" | "name" | "email"
```

You can use this union anywhere — for example, to restrict a parameter.

```ts
function getField(user: User, key: keyof User) {
    return user[key];
}

getField(user, "name");  // OK
getField(user, "age");   // Error: "age" is not a key of User
```

---

## Combining `keyof` and `typeof`

This is where the magic happens. You can get the keys of a **value**.

```ts
const permissions = {
    read: true,
    write: false,
    delete: false,
};

type PermissionKey = keyof typeof permissions;
// "read" | "write" | "delete"
```

If you add or rename a key in `permissions`, `PermissionKey` updates
on its own. No duplicate type definitions to maintain.

---

## Index access types (`T[K]`)

You can read a property type using bracket notation, just like JavaScript
but in the type world.

```ts
type User = { id: number; name: string; address: { city: string } };

type IdType = User["id"];        // number
type CityType = User["address"]["city"]; // string

// You can also use unions:
type Mixed = User["id" | "name"]; // number | string
```

This is great when you do not want to repeat a type that already exists.

---

## Generic functions with `keyof`

This is the most useful real-world pattern.

```ts
function getProp<T, K extends keyof T>(obj: T, key: K): T[K] {
    return obj[key];
}

const user = { id: 1, name: "Sakif" };

const id = getProp(user, "id");     // type: number
const name = getProp(user, "name"); // type: string
// getProp(user, "age");            // Error: not a key
```

TypeScript knows exactly which key you passed and gives you the right
return type.

---

## `typeof` in expressions vs types

There are **two** `typeof` operators that look identical but live in
different worlds.

**1. JavaScript `typeof` (runtime):**

```ts
if (typeof value === "string") { /* ... */ }
```

This checks the type **at runtime**. It returns a string like
`"string"` or `"number"`.

**2. TypeScript `typeof` (compile-time, in type positions):**

```ts
type T = typeof user;
```

This works **at compile time** to extract a type. It does not exist at
runtime.

| `typeof` location           | When it runs   | What it does            |
| --------------------------- | -------------- | ----------------------- |
| Inside an expression        | Runtime        | Returns a type string   |
| Inside a type annotation    | Compile time   | Returns a TypeScript type |

---

## Real world examples

**Locking strings to object keys (avoid typos):**

```ts
const routes = {
    home: "/",
    profile: "/profile",
    settings: "/settings",
};

type RouteName = keyof typeof routes;

function navigate(to: RouteName) {
    window.location.href = routes[to];
}

navigate("home");    // OK
navigate("login");   // Error: "login" not a route
```

**Type-safe form fields:**

```ts
type FormValues = { name: string; email: string; age: number };

function setField<K extends keyof FormValues>(
    key: K,
    value: FormValues[K]
) {
    // ...
}

setField("name", "Sakif");  // OK
setField("age", 25);        // OK
setField("age", "25");      // Error: must be number
```

**Reusing a constant as a type:**

```ts
const STATUS = {
    IDLE: "idle",
    LOADING: "loading",
    DONE: "done",
} as const;

type Status = typeof STATUS[keyof typeof STATUS];
// "idle" | "loading" | "done"
```

Note: `as const` is important — without it, the values would be `string`
instead of literal types.

---

## Quick reference table

| Operator               | Use it on           | Result                            |
| ---------------------- | ------------------- | --------------------------------- |
| `typeof x` (in type)   | A value             | The type of that value            |
| `keyof T`              | A type              | Union of its keys                 |
| `keyof typeof obj`     | A value             | Union of the keys of that value   |
| `T[K]`                 | A type + key        | The type of that property         |
| `typeof x` (in `if`)   | A value (runtime)   | A string like `"string"`          |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Restrict a string to be one of an object's keys                      | `keyof T`                 | `key: keyof User`                        |
| Get the type of an existing constant / config                        | `typeof value`            | `type Config = typeof CONFIG`            |
| Lock route names to keys of a routes object                          | `keyof typeof routes`     | `type RouteName = keyof typeof routes`   |
| Type-safe `getProp(obj, key)` helper                                 | Generic + `keyof T`       | `<T, K extends keyof T>(o: T, k: K)`     |
| Setter that knows value type from key                                | `T[K]` index access       | `value: T[K]`                            |
| Inferring type from a function's return                              | `ReturnType<typeof fn>`   | `type User = ReturnType<typeof getUser>` |
| Reusing API constants as a type                                      | `typeof X[keyof typeof X]`| values of `STATUS as const`              |
| Need literal types from object values                                | `as const` + `typeof`     | `const X = {...} as const`               |
| Runtime check of primitive type (string/number)                      | JS `typeof` in `if`       | `if (typeof x === "string")`             |
| Iterate over allowed config keys                                     | `keyof typeof`            | `for (const k of Object.keys(cfg))`      |
| Build form helpers — `setField(key, value)` with matched types       | Generic + `keyof` + `T[K]` | `<K extends keyof Form>(k:K, v:Form[K])`|
| Get value type of a Record / dictionary                              | `T[keyof T]`              | `type Vals = T[keyof T]`                 |

---

## Running the examples

From this folder:

```bash
npx ts-node "keyof-typeof.ts"
```
