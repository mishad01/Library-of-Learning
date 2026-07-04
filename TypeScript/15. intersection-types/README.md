# Intersection Types in TypeScript

An intersection type **combines two or more types into one**. The new
type has all the properties of all the parts. While a union (`|`) means
"this OR that", an intersection (`&`) means "this AND that".

---

## Table of Contents

1. [Union vs Intersection](#union-vs-intersection)
2. [Basic intersection](#basic-intersection)
3. [Intersecting interfaces](#intersecting-interfaces)
4. [Intersection with optional properties](#intersection-with-optional-properties)
5. [Conflicting properties](#conflicting-properties)
6. [Mixins pattern](#mixins-pattern)
7. [Real world examples](#real-world-examples)
8. [Quick reference table](#quick-reference-table)

---

## Union vs Intersection

| Operator | Meaning            | Example                          |
| -------- | ------------------ | -------------------------------- |
| `\|`     | OR (one of)        | `string \| number`               |
| `&`      | AND (all of)       | `Person & Employee`              |

```ts
type A = { a: string };
type B = { b: number };

type Union = A | B;        // a OR b
type Intersection = A & B; // both a AND b

const u1: Union = { a: "hi" };           // OK
const u2: Union = { b: 1 };              // OK

const i1: Intersection = { a: "hi", b: 1 }; // must have both
// const i2: Intersection = { a: "hi" };    // Error: missing b
```

---

## Basic intersection

You combine two types using `&`. The result has **all** fields.

```ts
type Person = { name: string };
type Employee = { salary: number };

type Worker = Person & Employee;

const w: Worker = {
    name: "Sakif",
    salary: 50000,
};
```

---

## Intersecting interfaces

You can do the same with interfaces.

```ts
interface HasName { name: string }
interface HasAge { age: number }

type User = HasName & HasAge;

const u: User = { name: "Sakif", age: 25 };
```

This is similar to interface `extends`, but more flexible — you can
intersect on the fly.

---

## Intersection with optional properties

If a property is optional in one type, it stays optional in the result.

```ts
type A = { name: string };
type B = { age?: number };

type C = A & B;

const c1: C = { name: "Sakif" };          // OK — age is optional
const c2: C = { name: "Sakif", age: 25 }; // OK
```

---

## Conflicting properties

If two types share a property with different types, the result is
`never` (impossible).

```ts
type A = { id: string };
type B = { id: number };

type C = A & B;
// C.id has type: string & number = never (no value can be both)
```

This is a sign that your types do not really fit together.

---

## Mixins pattern

Intersections are great for **mixing behaviors**.

```ts
type Walker = { walk: () => void };
type Swimmer = { swim: () => void };

type Amphibian = Walker & Swimmer;

const frog: Amphibian = {
    walk: () => console.log("walking"),
    swim: () => console.log("swimming"),
};
```

---

## Real world examples

**Adding props to a base component:**

```ts
type ButtonProps = {
    label: string;
    onClick: () => void;
};

type IconProps = {
    iconName: string;
};

type IconButtonProps = ButtonProps & IconProps;

const props: IconButtonProps = {
    label: "Save",
    onClick: () => {},
    iconName: "save",
};
```

**Extending API responses:**

```ts
type ApiBase = {
    success: boolean;
    timestamp: number;
};

type UserData = {
    user: { id: number; name: string };
};

type UserResponse = ApiBase & UserData;
```

**Combining domain types:**

```ts
type Identifiable = { id: string };
type Timestamped = { createdAt: Date; updatedAt: Date };

type Post = Identifiable & Timestamped & { title: string; body: string };
```

---

## Quick reference table

| Pattern                  | Meaning                            |
| ------------------------ | ---------------------------------- |
| `A \| B`                 | A OR B (one of them)               |
| `A & B`                  | A AND B (both at once)             |
| Optional in one          | Stays optional in result           |
| Same key, different type | Becomes `never` (impossible)       |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| User that is BOTH `Admin` AND `Employee`                             | `&`                       | `type X = Admin & Employee`              |
| Combine common API fields (`success`, `timestamp`) with payload      | `&`                       | `type Res = ApiBase & UserData`          |
| Adding `id` + `createdAt`/`updatedAt` to multiple entities           | `&`                       | `Identifiable & Timestamped & { ... }`   |
| Component is BOTH a Button AND an Icon                               | `&`                       | `type IconBtn = ButtonProps & IconProps` |
| Mixing behaviors (Walker + Swimmer = Amphibian)                      | `&`                       | `Walker & Swimmer`                       |
| A value that is EITHER A or B (not both)                             | `\|` (union, NOT `&`)     | `type X = A \| B`                        |
| Extending a type with extra fields                                   | `T & { extra: string }`   | `Animal & { breed: string }`             |
| Need to add fields to a 3rd-party type you can't modify              | `&` intersection          | `ThirdPartyT & MyExtras`                 |
| `interface` extending another interface                              | `extends`                 | `interface Dog extends Animal`           |
| Conflicting key types (`id: string` & `id: number`)                  | Result is `never`         | (means types are incompatible)           |
| Need flexible composition without rigid class hierarchy              | Intersection of types     | (mixin pattern)                          |

---

## Running the examples

From this folder:

```bash
npx ts-node "intersection.ts"
```
