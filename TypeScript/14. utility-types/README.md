# Utility Types in TypeScript

Utility types are **built-in helpers** that transform one type into
another. Instead of writing the same shape twice, you reuse and modify
an existing type. They save you time and keep your code clean.

---

## Table of Contents

1. [Why utility types?](#why-utility-types)
2. [`Partial<T>`](#partialt)
3. [`Required<T>`](#requiredt)
4. [`Readonly<T>`](#readonlyt)
5. [`Pick<T, K>`](#pickt-k)
6. [`Omit<T, K>`](#omitt-k)
7. [`Record<K, T>`](#recordk-t)
8. [`Exclude<T, U>` and `Extract<T, U>`](#excludet-u-and-extractt-u)
9. [`NonNullable<T>`](#nonnullablet)
10. [`ReturnType<T>` and `Parameters<T>`](#returntypet-and-parameterst)
11. [`Awaited<T>`](#awaitedt)
12. [Real world examples](#real-world-examples)
13. [Quick reference table](#quick-reference-table)

---

## Why utility types?

Suppose you have a `User` type:

```ts
type User = {
    id: number;
    name: string;
    email: string;
    password: string;
};
```

Now you want:

- A type where all fields are optional (for form drafts).
- A type with only the `name` and `email` fields (for public views).
- A type without `password` (for safe responses).

You could write three new types by hand. But utility types do it for you.

---

## `Partial<T>`

Makes **all properties optional**.

```ts
type User = { id: number; name: string; email: string };

type DraftUser = Partial<User>;
// Same as: { id?: number; name?: string; email?: string }

const draft: DraftUser = { name: "Sakif" }; // OK
```

Common use: updating an object where you only send the changed fields.

---

## `Required<T>`

Opposite of `Partial`. Makes **all properties required**.

```ts
type Settings = { theme?: string; lang?: string };

type FullSettings = Required<Settings>;
// { theme: string; lang: string } — no more optional
```

---

## `Readonly<T>`

Makes all properties read-only. You cannot change them after creation.

```ts
type User = { id: number; name: string };

const user: Readonly<User> = { id: 1, name: "Sakif" };
// user.name = "Ali"; // Error: cannot assign to read-only
```

---

## `Pick<T, K>`

Picks **only some keys** from a type.

```ts
type User = { id: number; name: string; email: string; password: string };

type UserPreview = Pick<User, "id" | "name">;
// { id: number; name: string }
```

Useful for making smaller types out of bigger ones.

---

## `Omit<T, K>`

Removes some keys from a type.

```ts
type User = { id: number; name: string; email: string; password: string };

type SafeUser = Omit<User, "password">;
// { id: number; name: string; email: string }
```

Very useful for API responses — never send the password back.

---

## `Record<K, T>`

Creates an object type with chosen keys and a single value type.

```ts
type Role = "admin" | "user" | "guest";

type Permissions = Record<Role, boolean>;
// { admin: boolean; user: boolean; guest: boolean }

const perms: Permissions = {
    admin: true,
    user: true,
    guest: false,
};
```

Common for dictionaries / lookup maps.

---

## `Exclude<T, U>` and `Extract<T, U>`

Both work on **union types**.

`Exclude` removes types from a union:

```ts
type Status = "loading" | "success" | "error";

type DoneStatus = Exclude<Status, "loading">;
// "success" | "error"
```

`Extract` keeps only matching types:

```ts
type GoodStatus = Extract<Status, "success">;
// "success"
```

---

## `NonNullable<T>`

Removes `null` and `undefined` from a type.

```ts
type Name = string | null | undefined;

type SafeName = NonNullable<Name>;
// string
```

---

## `ReturnType<T>` and `Parameters<T>`

Get the **return type** or **parameters** of a function type.

```ts
function getUser() {
    return { id: 1, name: "Sakif" };
}

type User = ReturnType<typeof getUser>;
// { id: number; name: string }
```

```ts
function add(a: number, b: number): number {
    return a + b;
}

type Args = Parameters<typeof add>;
// [number, number]
```

Very useful — you write the function once, and the types follow
automatically.

---

## `Awaited<T>`

Unwraps a Promise type.

```ts
type Result = Awaited<Promise<string>>;
// string

async function fetchUser() {
    return { id: 1, name: "Sakif" };
}

type User = Awaited<ReturnType<typeof fetchUser>>;
// { id: number; name: string }
```

---

## Real world examples

**Form draft:**

```ts
type User = { id: number; name: string; email: string };

function updateUser(id: number, fields: Partial<User>) {
    // fields can have any subset of User
}

updateUser(1, { name: "Ali" }); // OK
```

**Safe API response (no password):**

```ts
type User = { id: number; name: string; password: string };
type PublicUser = Omit<User, "password">;

function getUser(id: number): PublicUser {
    return { id, name: "Sakif" };
}
```

**React component props with defaults:**

```ts
type Props = { title: string; subtitle?: string; count?: number };
type RequiredProps = Required<Props>; // when defaults are filled in
```

**Permission map:**

```ts
type Role = "admin" | "editor" | "viewer";
const access: Record<Role, string[]> = {
    admin: ["read", "write", "delete"],
    editor: ["read", "write"],
    viewer: ["read"],
};
```

---

## Quick reference table

| Utility            | What it does                                |
| ------------------ | ------------------------------------------- |
| `Partial<T>`       | All properties optional                     |
| `Required<T>`      | All properties required                     |
| `Readonly<T>`      | All properties read-only                    |
| `Pick<T, K>`       | Pick chosen keys                            |
| `Omit<T, K>`       | Remove chosen keys                          |
| `Record<K, T>`     | Object with K as keys, T as values          |
| `Exclude<T, U>`    | Remove members from a union                 |
| `Extract<T, U>`    | Keep matching members of a union            |
| `NonNullable<T>`   | Remove null and undefined                   |
| `ReturnType<T>`    | Return type of a function                   |
| `Parameters<T>`    | Parameter types of a function (as tuple)    |
| `Awaited<T>`       | Unwrap a Promise type                       |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Update endpoint where any subset of fields can be sent               | `Partial<T>`              | `updateUser(id, fields: Partial<User>)`  |
| Form draft state where everything starts empty                       | `Partial<T>`              | `useState<Partial<User>>({})`            |
| Configuration where all defaults are finally filled in               | `Required<T>`             | `Required<Settings>`                     |
| Lock an object so no one mutates it                                  | `Readonly<T>`             | `Readonly<Config>`                       |
| Public preview type (just `id` + `name`)                             | `Pick<T, K>`              | `Pick<User, "id" \| "name">`             |
| API response — strip out `password` / sensitive fields               | `Omit<T, K>`              | `Omit<User, "password">`                 |
| Dictionary / lookup map (role → permission)                          | `Record<K, V>`            | `Record<Role, boolean>`                  |
| Remove some literal members from a union                             | `Exclude<T, U>`           | `Exclude<Status, "loading">`             |
| Keep only specific union members                                     | `Extract<T, U>`           | `Extract<Status, "success">`             |
| Remove `null` / `undefined` from a type                              | `NonNullable<T>`          | `NonNullable<string \| null>`            |
| Re-use a function's return type                                      | `ReturnType<typeof fn>`   | `type User = ReturnType<typeof getUser>` |
| Re-use a function's parameter types                                  | `Parameters<typeof fn>`   | `type Args = Parameters<typeof add>`     |
| Unwrap a Promise's resolved type                                     | `Awaited<T>`              | `Awaited<Promise<User>>`                 |
| Build a CRUD API: Create=`Omit<T,"id">`, Update=`Partial<T>`         | Combo of utilities        | `Omit<User, "id">` etc.                  |

---

## Running the examples

From this folder:

```bash
npx ts-node "utility-types.ts"
```
