# Discriminated Unions in TypeScript

A discriminated union (also called a **tagged union**) is a union of
object types where every option shares a single common property —
called the **discriminator**. TypeScript uses this property to know
exactly which object you have, and to give you safe access to its
fields. This pattern is one of the most useful in real applications.

---

## Table of Contents

1. [Why we need discriminated unions](#why-we-need-discriminated-unions)
2. [The pattern](#the-pattern)
3. [Narrowing with the discriminator](#narrowing-with-the-discriminator)
4. [Exhaustiveness checks with `never`](#exhaustiveness-checks-with-never)
5. [Real world examples](#real-world-examples)
6. [Best practices](#best-practices)
7. [Quick reference table](#quick-reference-table)

---

## Why we need discriminated unions

Plain unions can be hard to use. For example:

```ts
type Square = { size: number };
type Circle = { radius: number };
type Shape = Square | Circle;

function area(shape: Shape) {
    // Which one is it? TypeScript does not know.
    // shape.size or shape.radius? Both give errors.
}
```

TypeScript cannot tell which shape it is. We need a way to tell it.

---

## The pattern

Add a shared field — usually called `kind`, `type`, or `tag` — with a
**literal type** to each option.

```ts
type Square = { kind: "square"; size: number };
type Circle = { kind: "circle"; radius: number };
type Shape = Square | Circle;
```

Now each shape carries its own label.

---

## Narrowing with the discriminator

Once you check the discriminator, TypeScript knows the exact shape.

```ts
function area(shape: Shape): number {
    if (shape.kind === "square") {
        return shape.size * shape.size; // OK — TS knows it is Square
    } else {
        return Math.PI * shape.radius ** 2; // TS knows it is Circle
    }
}
```

A `switch` is often cleaner:

```ts
function area(shape: Shape): number {
    switch (shape.kind) {
        case "square":
            return shape.size * shape.size;
        case "circle":
            return Math.PI * shape.radius ** 2;
    }
}
```

---

## Exhaustiveness checks with `never`

This is the most powerful trick. By assigning the leftover to a `never`
variable, TypeScript will **complain** if you ever add a new option and
forget to handle it.

```ts
type Square = { kind: "square"; size: number };
type Circle = { kind: "circle"; radius: number };
type Triangle = { kind: "triangle"; base: number; height: number };
type Shape = Square | Circle | Triangle;

function area(shape: Shape): number {
    switch (shape.kind) {
        case "square":
            return shape.size * shape.size;
        case "circle":
            return Math.PI * shape.radius ** 2;
        case "triangle":
            return 0.5 * shape.base * shape.height;
        default:
            const _exhaustive: never = shape; // Error if a case is missed
            return _exhaustive;
    }
}
```

If you later add `type Hexagon = { kind: "hexagon"; ... }` to the
union and forget to add a `case`, this line will fail to compile. That
way you cannot ship broken code by accident.

---

## Real world examples

**1. API responses (success / error):**

```ts
type Success<T> = { status: "success"; data: T };
type Failure   = { status: "error"; message: string };
type Result<T> = Success<T> | Failure;

function handle(res: Result<User>) {
    if (res.status === "success") {
        console.log(res.data.name);
    } else {
        console.log(res.message);
    }
}
```

**2. Redux / state machine actions:**

```ts
type Action =
    | { type: "INCREMENT" }
    | { type: "DECREMENT" }
    | { type: "SET"; value: number };

function reducer(state: number, action: Action): number {
    switch (action.type) {
        case "INCREMENT":
            return state + 1;
        case "DECREMENT":
            return state - 1;
        case "SET":
            return action.value;
    }
}
```

This is exactly how Redux Toolkit and `useReducer` work.

**3. UI state (loading / loaded / error):**

```ts
type UiState<T> =
    | { state: "idle" }
    | { state: "loading" }
    | { state: "success"; data: T }
    | { state: "error"; error: string };

function render(s: UiState<User>) {
    switch (s.state) {
        case "idle":    return "Press load";
        case "loading": return "Loading...";
        case "success": return `Hello ${s.data.name}`;
        case "error":   return `Oops: ${s.error}`;
    }
}
```

This is a clean way to model screens in React Native — no more
`isLoading && !error && data` boolean spaghetti.

---

## Best practices

1. Use a short, consistent discriminator name like `kind` or `type`
   across your project.
2. Always make the discriminator a **literal type** (e.g., `"square"`),
   not a general `string`.
3. Use `switch` over `if / else` chains — it pairs perfectly with
   exhaustiveness checks.
4. Add the `never` check in the `default` branch to catch missed cases.
5. Avoid nullable discriminators (`kind?: "..."`) — that breaks
   narrowing.

---

## Quick reference table

| Concept                  | Example                                            |
| ------------------------ | -------------------------------------------------- |
| Discriminator field      | `kind: "square"`                                   |
| Union of tagged objects  | `type Shape = Square \| Circle`                    |
| Narrowing                | `if (shape.kind === "square") { ... }`             |
| Switch narrowing         | `switch (shape.kind) { case "square": ... }`       |
| Exhaustiveness check     | `const _exhaustive: never = shape;`                |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| API response: success vs error (with different fields)               | Discriminated union       | `{ status: "ok", data } \| { status: "error", message }` |
| Redux/`useReducer` actions                                           | Discriminated union       | `{ type: "INCREMENT" } \| { type: "SET", value }` |
| UI state (idle / loading / success / error)                          | Discriminated union       | clean 4-state model                      |
| Shapes with different fields (Square, Circle)                        | Discriminated union       | `kind: "square" \| "circle"`             |
| WebSocket message types                                              | Discriminated union       | `{ type: "chat" } \| { type: "ping" }`   |
| Event system / pub-sub                                               | Discriminated union       | `event.type` discriminator               |
| Form field types (text / select / checkbox)                          | Discriminated union       | each variant has its own fields          |
| Catch missing case at compile time                                   | `never` exhaustive check  | `const _: never = shape`                 |
| Switch is cleaner than nested ifs                                    | `switch(x.kind)`          | each case narrows automatically          |
| Replacing booleans like `isLoading + isError + data`                 | Discriminated union       | one state field tells the full story     |
| Different payload depending on a type field                          | Discriminated union       | API actions / commands                   |
| Decide between two unrelated shapes by checking a property           | Use `in` (not discriminator) | for unsystematic unions              |

---

## Running the examples

From this folder:

```bash
npx ts-node "discriminated-unions.ts"
```
