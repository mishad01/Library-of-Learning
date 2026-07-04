# TypeScript Custom Types (Type Aliases)

A focused guide to creating your own named types with the `type` keyword. This document pairs with [custom-type.ts](custom-type.ts) — read them side by side.

---

## Table of Contents

1. [What is a type alias?](#1-what-is-a-type-alias)
2. [Object type alias](#2-object-type-alias)
3. [Union type alias (a fixed set of values)](#3-union-type-alias-a-fixed-set-of-values)
4. [Optional properties (`?`)](#4-optional-properties-)
5. [Readonly properties](#5-readonly-properties)
6. [Intersection types (`&`)](#6-intersection-types-)
7. [Extending a type with intersection](#7-extending-a-type-with-intersection)
8. [Quick reference](#8-quick-reference)

---

## 1. What is a type alias?

A **type alias** gives a name to a type so you can reuse it instead of repeating the same shape everywhere. You create one with the `type` keyword.

```typescript
type User = {
  userName: string;
  userId: number;
};
```

Now `User` can be used anywhere a type is expected, exactly like a built-in type such as `string`:

```typescript
let a: User;     // a single user
let b: User[];   // an array of users
```

The benefits: less repetition, one place to update the shape, and a meaningful name that documents your intent.

---

## 2. Object type alias

An object type describes the **shape** of an object — which properties it has and the type of each.

```typescript
type User = {
  userName: string;
  userId: number;
  email?: string; // optional (see section 4)
};

let user1: User = { userName: "mishad", userId: 10 };
```

If you miss a required property or use the wrong type, TypeScript reports an error before the code runs.

```typescript
let bad: User = { userName: "mishad" }; // ERROR - userId is missing
```

You can also make an array of the type by adding `[]`:

```typescript
let users: User[] = []; // an array that holds User objects
```

---

## 3. Union type alias (a fixed set of values)

A union type alias restricts a value to a **specific list of allowed options**. When the options are exact strings, it is called a *string literal union*.

```typescript
type RequestType = "Get" | "Post" | "Put" | "Delete";

let requestType: RequestType;
requestType = "Get";   // OK
requestType = "Post";  // OK
requestType = "sdf";   // ERROR - not one of the four allowed values
```

This is extremely useful for function parameters, because TypeScript will reject any value outside the set and will autocomplete the valid ones for you.

```typescript
function requestHandler(requestType: RequestType) {
  if (requestType === "Get") {
    console.log("Handling GET request");
  }
  // ...handle the other cases
}

requestHandler("Post"); // OK
requestHandler("Patch"); // ERROR - not allowed
```

---

## 4. Optional properties (`?`)

Adding `?` after a property name makes it **optional** — the object is valid whether or not that property is present.

```typescript
type UserWithOptional = {
  userName: string;
  userId: number;
  email?: string; // optional
};

let user2: UserWithOptional = { userName: "Sakif", userId: 1 };                         // OK - email omitted
let user3: UserWithOptional = { userName: "Anis", userId: 2, email: "anis@gmail.com" }; // OK
```

When you read an optional property, its type includes `undefined`, so TypeScript will ask you to check it before using it.

```typescript
console.log(user2.email.length); // ERROR - email might be undefined
console.log(user2.email?.length); // OK - the ?. safely returns undefined if absent
```

---

## 5. Readonly properties

A property marked `readonly` can be set when the object is created, but **never reassigned** afterwards. It is useful for values that should never change, such as an ID.

```typescript
type UserReadonly = {
  readonly userId: number;
  userName: string;
};

let user4: UserReadonly = { userId: 1, userName: "Sakif" };

user4.userId = 2;          // ERROR - userId is readonly
user4.userName = "Mishad"; // OK - userName is not readonly
```

---

## 6. Intersection types (`&`)

An intersection combines multiple types into one. The result must satisfy **all** of them, so it needs every property from each part.

```typescript
type Admin = { role: string };
type Employee = { name: string; salary: number };

type AdminEmployee = Admin & Employee; // must have role, name, AND salary

let adminEmployee: AdminEmployee = {
  role: "admin",
  name: "Sakif",
  salary: 50000,
};
```

Leaving out any property from either side is an error:

```typescript
let bad: AdminEmployee = { role: "admin" }; // ERROR - name and salary are missing
```

> Tip: do not confuse `&` with `|`.
> - `A & B` means "must be **both** A and B" (all properties combined).
> - `A | B` means "can be **either** A or B" (one or the other).

---

## 7. Extending a type with intersection

A very common pattern is to take an existing type and add more fields to it using `&`. This avoids rewriting the shared properties.

```typescript
type Animal = { name: string };
type Dog = Animal & { breed: string }; // Dog has both name and breed

let dog: Dog = { name: "Bruno", breed: "Labrador" };
```

`Dog` inherits everything from `Animal` and adds `breed` on top.

---

## 8. Quick reference

| Goal                                          | Syntax                                  |
| --------------------------------------------- | --------------------------------------- |
| Name an object shape                          | `type User = { id: number }`            |
| Array of that type                            | `User[]`                                |
| Allow only specific values                    | `type T = "a" \| "b" \| "c"`            |
| Optional property                             | `email?: string`                        |
| Property that cannot change                   | `readonly id: number`                   |
| Combine types (must satisfy all)              | `type C = A & B`                        |
| Either one type or another                    | `type C = A \| B`                       |
| Extend a type with more fields                | `type Dog = Animal & { breed: string }` |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Reusing the same object shape in multiple files / functions          | `type` alias              | `type User = { id: number; name: string }` |
| API request method that can only be GET / POST / PUT / DELETE        | String literal union      | `type Method = "GET" \| "POST"`          |
| Form field that may or may not be filled                             | Optional property `?`     | `email?: string`                         |
| ID / primary key that must never be changed once set                 | `readonly`                | `readonly id: number`                    |
| A user that is both an `Admin` and an `Employee`                     | Intersection `&`          | `type X = Admin & Employee`              |
| A value that is either a `Success` or `Error` response               | Union `\|`                | `type Res = Success \| Error`            |
| Adding extra fields to an existing type without rewriting it         | Intersection extension    | `type Dog = Animal & { breed: string }`  |
| Quickly naming a complex function signature                          | `type` alias for function | `type Cb = (x: number) => void`          |
| Tuple with a meaningful name                                         | `type` alias for tuple    | `type Point = [number, number]`          |
| You need declaration merging or class implements                     | Use `interface` instead   | (see folder `7. interface`)              |

---

## How to run

```bash
npx ts-node "custom-type.ts"
```

Or compile then run:

```bash
tsc "custom-type.ts"
node "custom-type.js"
```
