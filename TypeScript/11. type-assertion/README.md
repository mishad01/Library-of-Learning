# Type Assertion (Type Casting) in TypeScript

Sometimes you know more about a value's type than TypeScript does. A
**type assertion** is your way of telling TypeScript: "Trust me, I know
this value is of this type." It does not change the value at runtime —
it only changes how TypeScript treats it.

---

## Table of Contents

1. [What is type assertion?](#what-is-type-assertion)
2. [Two ways to write it](#two-ways-to-write-it)
3. [Common use cases](#common-use-cases)
4. [Type assertion vs type conversion](#type-assertion-vs-type-conversion)
5. [Dangerous assertions](#dangerous-assertions)
6. [The `as const` assertion](#the-as-const-assertion)
7. [Non-null assertion (`!`)](#non-null-assertion-)
8. [Real world examples](#real-world-examples)
9. [Quick reference table](#quick-reference-table)

---

## What is type assertion?

Sometimes TypeScript gives a value a general type, but you know the
specific type. For example:

```ts
const input = document.getElementById("name");
// input is HTMLElement | null
// But you know it is an <input> element
```

You can tell TypeScript: "treat this as `HTMLInputElement`".

```ts
const input = document.getElementById("name") as HTMLInputElement;
input.value = "Sakif"; // Now TypeScript allows .value
```

This is type assertion. The value itself does not change — only the
**type that TypeScript sees** changes.

---

## Two ways to write it

**1. `as` syntax (recommended)**

```ts
const value = someValue as string;
```

**2. Angle bracket syntax (old)**

```ts
const value = <string>someValue;
```

> Use the `as` syntax. The angle bracket syntax does not work in `.tsx`
> files because `<string>` looks like a JSX tag.

---

## Common use cases

**1. Narrowing `unknown` after a check:**

```ts
function process(input: unknown) {
    const str = input as string;
    console.log(str.toUpperCase());
}
```

**2. DOM elements:**

```ts
const btn = document.querySelector(".submit") as HTMLButtonElement;
btn.disabled = true;
```

**3. JSON parsing (you know the shape):**

```ts
type User = { name: string; age: number };

const data = JSON.parse(jsonString) as User;
console.log(data.name);
```

**4. When working with API responses:**

```ts
const response = await fetch("/api/user");
const user = (await response.json()) as User;
```

---

## Type assertion vs type conversion

**This is important — they are NOT the same.**

```ts
const num = "42" as unknown as number;
console.log(num + 1); // "421" — not 43!
```

The string `"42"` is still a string at runtime. Type assertion only tells
TypeScript what to think — it does **not** change the actual value.

To truly convert a string to a number, use `Number()`:

```ts
const num = Number("42");
console.log(num + 1); // 43
```

| | Type Assertion | Type Conversion |
|---|---|---|
| Changes type checker view | Yes | Yes |
| Changes actual value | **No** | **Yes** |
| Example | `value as number` | `Number(value)` |

---

## Dangerous assertions

Type assertions turn off TypeScript's safety. If you lie, your code
breaks at runtime.

```ts
const x = "hello" as unknown as number;
x.toFixed(2); // Crashes — strings don't have toFixed
```

TypeScript blocks "obviously wrong" assertions:

```ts
// const a = "hello" as number; // Error
```

But you can force it with `as unknown as`:

```ts
const a = "hello" as unknown as number; // No error — but dangerous
```

**Rule:** Only assert when you are sure. Otherwise, use type guards.

---

## The `as const` assertion

`as const` tells TypeScript to use the most specific type possible.

```ts
let color = "red";              // type: string
let color2 = "red" as const;    // type: "red" (a literal)

const point = { x: 10, y: 20 };           // { x: number, y: number }
const point2 = { x: 10, y: 20 } as const; // { readonly x: 10, readonly y: 20 }
```

It is useful for making objects fully immutable and for creating literal
types.

---

## Non-null assertion (`!`)

The `!` symbol after a value tells TypeScript: "this is not null or
undefined".

```ts
function greet(name: string | null) {
    console.log(name!.toUpperCase()); // ! says: trust me, name is not null
}
```

Without `!`, TypeScript would complain because `name` could be `null`.

**Warning:** This is also dangerous. If `name` really is null, the code
crashes. Prefer real checks:

```ts
if (name) {
    console.log(name.toUpperCase());
}
```

---

## Real world examples

**React Native — `useRef`:**

```ts
const inputRef = useRef<TextInput>(null);

// Later, when you know it is mounted:
inputRef.current!.focus();
```

**Form events:**

```ts
function handleChange(e: React.ChangeEvent<HTMLInputElement>) {
    const target = e.target as HTMLInputElement;
    console.log(target.value);
}
```

**Local storage data:**

```ts
const raw = localStorage.getItem("user");
const user = JSON.parse(raw!) as User;
```

---

## Quick reference table

| Syntax                  | Meaning                                   | Safe? |
| ----------------------- | ----------------------------------------- | ----- |
| `value as Type`         | Treat value as this type                  | Risky if wrong |
| `<Type>value`           | Same, old syntax (not for `.tsx`)         | Risky if wrong |
| `value as const`        | Use the most specific literal type        | Safe  |
| `value!`                | Tell TS this is not null/undefined        | Risky if wrong |
| `value as unknown as X` | Force any cast (escape hatch)             | Very risky |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| `document.getElementById` returns `HTMLElement \| null`              | `as HTMLInputElement`     | `el as HTMLInputElement`                 |
| Parsing JSON when you know the shape                                 | `as User`                 | `JSON.parse(s) as User`                  |
| Narrowing an `unknown` after checking                                | `as Type`                 | `(val as string).toUpperCase()`          |
| Inside `.tsx` (JSX) files                                            | `as` syntax only          | `value as string` (NOT `<string>value`)  |
| Make object fully immutable + literal types                          | `as const`                | `{ x: 10 } as const`                     |
| You're SURE a value is not null right now                            | `!` non-null assertion    | `inputRef.current!.focus()`              |
| Better than `!`: actually check                                      | `if` guard                | `if (ref.current) ref.current.focus()`   |
| Truly converting string to number (changes value)                    | `Number()` / `parseInt`   | `Number("42") + 1  // 43`                |
| Truly converting to string                                           | `String()` / template     | `String(123)` or `` `${123}` ``          |
| Type system blocks your assertion as "too far"                       | `as unknown as T`         | (use sparingly — dangerous)              |
| API response, you've validated it externally                         | `as User`                 | `(await res.json()) as User`             |
| Event target in DOM handler                                          | `as HTMLInputElement`     | `e.target as HTMLInputElement`           |
| Better than assertion: use type guards (typeof / in / instanceof)    | Type guard                | (preferred when possible)                |

---

## Running the examples

From this folder:

```bash
npx ts-node "type-assertion.ts"
```
