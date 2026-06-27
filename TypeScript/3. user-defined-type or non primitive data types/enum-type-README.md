# TypeScript Enums

A focused guide to enums — named, fixed sets of constants. This document pairs with [enum-type.ts](enum-type.ts) — read them side by side.

---

## Table of Contents

1. [What is an enum?](#1-what-is-an-enum)
2. [Numeric enums](#2-numeric-enums)
3. [Custom numeric values](#3-custom-numeric-values)
4. [String enums](#4-string-enums)
5. [Heterogeneous enums](#5-heterogeneous-enums)
6. [`const enum`](#6-const-enum)
7. [Using an enum in a function](#7-using-an-enum-in-a-function)
8. [Reverse mapping (numeric only)](#8-reverse-mapping-numeric-only)
9. [Enum vs literal union type](#9-enum-vs-literal-union-type)
10. [Quick reference](#10-quick-reference)

---

## 1. What is an enum?

An **enum** (short for *enumeration*) gives friendly names to a fixed set of related constant values. Instead of scattering "magic" numbers or strings through your code, you collect them under one named type.

```typescript
enum Direction {
  Up,
  Down,
  Left,
  Right,
}

let move: Direction = Direction.Up;
```

Two key rules:
- Names inside an enum must be unique (no duplicates).
- Unlike most TypeScript types, an enum exists at **runtime** as a real JavaScript object — it is not erased during compilation (except `const enum`, see section 6).

---

## 2. Numeric enums

If you do not assign values, members are auto-numbered starting at `0`, incrementing by one.

```typescript
enum RequestType {
  readData,   // 0
  saveData,   // 1
  deleteData, // 2
}

console.log(RequestType.readData); // 0
```

---

## 3. Custom numeric values

You can assign explicit numbers. Any members after an assigned one continue counting up from it.

```typescript
enum StatusCode {
  Ok = 200,
  NotFound = 404,
  ServerError = 500,
}

console.log(StatusCode.Ok); // 200
```

```typescript
enum Days {
  Monday = 1,
  Tuesday,   // 2 - continues from Monday
  Wednesday, // 3
}
```

---

## 4. String enums

Each member is given an explicit string value. String enums are more readable in logs and debugging because the value is a meaningful word rather than a number.

```typescript
enum UserRequest {
  ReadData = "READ_DATA",
  SaveData = "SAVE_DATA",
  UpdateData = "UPDATE_DATA",
}

console.log(UserRequest.ReadData);      // "READ_DATA"
console.log(UserRequest["UpdateData"]); // "UPDATE_DATA"
```

Note: string enums do **not** support reverse mapping (see section 8).

---

## 5. Heterogeneous enums

An enum can technically mix string and numeric members. This is allowed but generally discouraged, since it makes the enum harder to reason about.

```typescript
enum User {
  id = 101,
  name = "anisul",
}
```

Prefer keeping an enum all-numeric or all-string.

---

## 6. `const enum`

A `const enum` is **inlined at compile time**. The compiler replaces each usage with its literal value and generates no enum object in the JavaScript output, which makes it more efficient.

```typescript
const enum Direction {
  Up,
  Down,
  Left,
  Right,
}

let move = Direction.Up; // compiles directly to: let move = 0;
```

Trade-off: because no runtime object exists, you cannot do things that need the object (such as reverse mapping or iterating over members).

---

## 7. Using an enum in a function

Typing a parameter as the enum forces callers to pass an actual enum member, not a loose string or number. This is one of the main safety benefits.

```typescript
enum Status {
  Active = "ACTIVE",
  Inactive = "INACTIVE",
}

function getStatus(status: Status): void {
  console.log(status);
}

getStatus(Status.Active); // OK
getStatus("ACTIVE");      // ERROR - must use the enum member, not a raw string
```

---

## 8. Reverse mapping (numeric only)

A normal lookup goes **name to value** (forward). A numeric enum also supports the reverse: **value to name**.

```typescript
enum Days {
  Monday = 1,
  Tuesday,
  Wednesday,
}

Days["Monday"]; // 1        - forward (name -> value)
Days[1];        // "Monday" - reverse (value -> name)
```

### Why it works

A numeric enum compiles to a plain object that stores **both directions at once**:

```javascript
var Days = {
  Monday: 1,
  Tuesday: 2,
  Wednesday: 3,
  1: "Monday",    // the reverse entries
  2: "Tuesday",
  3: "Wednesday",
};
```

Each pair is stored twice, so the key `1` genuinely exists and returns `"Monday"`.

### Why only numeric enums

A string enum stores only one direction:

```javascript
var Color = { Red: "RED", Blue: "BLUE" }; // no reverse entries
```

With numbers, names (words) and values (numbers) can never collide, so storing both directions is safe. With strings, a value could clash with a name, so TypeScript deliberately skips reverse mapping.

| Enum type    | Forward (`name -> value`) | Reverse (`value -> name`) |
| ------------ | ------------------------- | ------------------------- |
| Numeric enum | yes                       | **yes** (`Days[1]`)       |
| String enum  | yes                       | no (`undefined`)          |

---

## 9. Enum vs literal union type

Both restrict a value to a fixed set, but they are not the same thing under the hood.

```typescript
// enum approach - creates a runtime object
enum HttpMethod {
  Get = "GET",
  Post = "POST",
  Delete = "DELETE",
}

// literal union approach - pure type, no runtime code
type HttpMethodType = "GET" | "POST" | "DELETE";
```

| Aspect              | `enum`                        | Literal union (`"a" \| "b"`) |
| ------------------- | ----------------------------- | ---------------------------- |
| Generates JS code   | Yes (a runtime object)        | No - erased at compile time  |
| Reverse mapping     | Yes (numeric enums)           | No                           |
| Reusable at runtime | Yes (can iterate, pass around)| No                           |
| Simplicity          | More machinery                | Lightweight                  |

Rule of thumb:
- **Use an enum** when you need reverse mapping, or a real object you can iterate or reference at runtime.
- **Use a literal union** when you just need type safety with zero extra overhead. This is preferred in most modern TypeScript code.

---

## 10. Quick reference

| Goal                                   | Syntax                                |
| -------------------------------------- | ------------------------------------- |
| Auto-numbered enum                     | `enum E { A, B, C }` (0, 1, 2)        |
| Custom numbers                         | `enum E { Ok = 200, NotFound = 404 }` |
| String enum                            | `enum E { A = "A", B = "B" }`         |
| Inlined, no runtime object             | `const enum E { ... }`                |
| Forward lookup (name to value)         | `E.A` or `E["A"]`                     |
| Reverse lookup (value to name)         | `E[0]` (numeric enums only)           |
| Lightweight fixed set, no runtime code | `type T = "a" \| "b" \| "c"`          |

---

## How to run

```bash
npx ts-node "enum-type.ts"
```

Or compile then run:

```bash
tsc "enum-type.ts"
node "enum-type.js"
```
