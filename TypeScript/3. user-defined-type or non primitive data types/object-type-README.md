# TypeScript Object Types

A focused guide to describing the shape of objects in TypeScript, and why the generic `object` type is usually the wrong choice. This document pairs with [object-type.ts](object-type.ts) — read them side by side.

---

## Table of Contents

1. [Type inference (let TypeScript figure it out)](#1-type-inference-let-typescript-figure-it-out)
2. [Inline object type annotation](#2-inline-object-type-annotation)
3. [Optional properties (`?`)](#3-optional-properties-)
4. [Readonly properties](#4-readonly-properties)
5. [Nested objects](#5-nested-objects)
6. [The generic `object` type (and why to avoid it)](#6-the-generic-object-type-and-why-to-avoid-it)
7. [Array of objects](#7-array-of-objects)
8. [Quick reference](#8-quick-reference)

---

## 1. Type inference (let TypeScript figure it out)

When you assign an object literal directly, TypeScript **infers** its shape automatically — you do not always have to write the type yourself.

```typescript
let user1 = {
  userName: "sakif",
  userId: 10,
};
// inferred as: { userName: string; userId: number }
```

Once inferred, that shape is enforced. Reassigning must match it:

```typescript
user1 = { userName: "mishad", userId: 10 }; // OK - same shape
user1 = { userName: "mishad" };             // ERROR - userId is missing
```

This is the simplest approach and is often all you need.

---

## 2. Inline object type annotation

When you declare a variable before assigning it, you describe the shape directly in the annotation between `{ }`.

```typescript
let user2: {
  userName: string;
  userId: number;
};

user2 = { userName: "mishad", userId: 10 }; // OK
```

This is handy for one-off shapes. If you reuse the same shape in several places, prefer a named `type` alias instead (see [custom-type-README.md](custom-type-README.md)).

---

## 3. Optional properties (`?`)

A property marked with `?` may be present or left out entirely.

```typescript
let user2: {
  userName: string;
  userId?: number; // optional
};

user2 = { userName: "mishad" };            // OK - userId omitted
user2 = { userName: "sakif", userId: 10 }; // OK
```

---

## 4. Readonly properties

A `readonly` property can be set when the object is created, but never reassigned afterwards.

```typescript
let user6: { readonly userId: number; userName: string } = {
  userId: 1,
  userName: "Sakif",
};

user6.userId = 2;          // ERROR - userId is readonly
user6.userName = "Mishad"; // OK - userName is not readonly
```

---

## 5. Nested objects

A property can itself be an object with its own shape. You nest one `{ }` block inside another.

```typescript
let user7: {
  userName: string;
  address: {
    city: string;
    zip: number;
  };
} = {
  userName: "Sakif",
  address: { city: "Dhaka", zip: 1200 },
};

console.log(user7.address.city); // "Dhaka"
```

When shapes get deeply nested like this, extracting them into named `type` aliases keeps the code readable.

---

## 6. The generic `object` type (and why to avoid it)

The type `object` only means **"some non-primitive value"** — not a string, number, boolean, etc. Crucially, it carries **no information about which properties exist**.

```typescript
let user3: object;
user3 = { userName: "mishad", userId: 10 };

user3.userName; // ERROR - the type `object` has no known shape
```

### Why does this fail?

Even though the value clearly has `userName` at runtime, TypeScript only tracks the **declared type**, which is `object`. The annotation you wrote *overrides* what would otherwise be inferred and throws the shape information away.

```typescript
let user3: object = { userName: "mishad" };
//         ^^^^^^ this label discards the shape
```

So when you access `user3.userName`, TypeScript reasons: *"All I know is that this is some object. I cannot guarantee `userName` exists."* — and rejects it to keep you safe.

### The fix

Give TypeScript the actual shape using any of the earlier approaches:

```typescript
// Option 1 - let it infer (drop the annotation)
let a = { userName: "mishad", userId: 10 };

// Option 2 - inline type
let b: { userName: string; userId: number } = { userName: "mishad", userId: 10 };

// Option 3 - named type alias (best for reuse)
type User = { userName: string; userId: number };
let c: User = { userName: "mishad", userId: 10 };
```

| Declaration                          | Does TS know `userName`?        |
| ------------------------------------ | ------------------------------- |
| `let u: object`                      | No - `object` has no shape      |
| `let u = { ... }` (inferred)         | Yes - inferred from the value   |
| `let u: { userName: string }`        | Yes - you described the shape   |
| `let u: User` (type alias)           | Yes - the alias describes it    |

**Takeaway:** avoid annotating something as plain `object` when you care about its properties. Use inference, an inline type, or a type alias.

---

## 7. Array of objects

Add `[]` to make an array whose elements are objects.

```typescript
let user4: object[];
let user5: object[];

user4 = [{ userName: "mishad", userId: 10 }];
user5 = [{ userName: "anis", userId: 20 }];

user4.push(...user5); // spread merges user5's items into user4
```

Note: `object[]` has the same limitation as section 6 — you cannot read properties off the elements. For real data, prefer `User[]` where `User` is a typed shape.

---

## 8. Quick reference

| Goal                                  | Syntax                                          |
| ------------------------------------- | ----------------------------------------------- |
| Let TS infer the shape                | `let u = { id: 1 }`                             |
| Describe the shape inline             | `let u: { id: number }`                         |
| Optional property                     | `userId?: number`                               |
| Property that cannot change           | `readonly userId: number`                       |
| Nested object                         | `{ address: { city: string } }`                 |
| Array of typed objects (preferred)    | `User[]`                                         |
| Generic non-primitive (avoid)         | `object` - no property access allowed           |

---

## How to run

```bash
npx ts-node "object-type.ts"
```

Or compile then run:

```bash
tsc "object-type.ts"
node "object-type.js"
```
