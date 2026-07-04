# Optional Chaining (`?.`) and Nullish Coalescing (`??`)

These are two small but very useful operators. They help you safely
work with values that might be `null` or `undefined`. You will use them
in almost every React Native screen and every API call.

---

## Table of Contents

1. [The problem they solve](#the-problem-they-solve)
2. [Optional chaining (`?.`)](#optional-chaining-)
3. [Optional chaining with arrays](#optional-chaining-with-arrays)
4. [Optional chaining with functions](#optional-chaining-with-functions)
5. [Nullish coalescing (`??`)](#nullish-coalescing-)
6. [`??` vs `||`](#-vs-)
7. [Combining `?.` and `??`](#combining--and-)
8. [Nullish assignment (`??=`)](#nullish-assignment-)
9. [Real world examples](#real-world-examples)
10. [Quick reference table](#quick-reference-table)

---

## The problem they solve

Imagine you fetch a user from an API. Sometimes data is missing.

```ts
const user = { name: "Sakif", address: undefined };
console.log(user.address.city); // Crash! Cannot read 'city' of undefined
```

Old fix:

```ts
const city = user && user.address && user.address.city;
```

This works but is ugly. Optional chaining makes it clean.

---

## Optional chaining (`?.`)

If the value before `?.` is `null` or `undefined`, the whole expression
stops and returns `undefined` — it does **not** crash.

```ts
const user = { name: "Sakif", address: undefined };

console.log(user.address?.city); // undefined (no crash)
```

You can chain it many times:

```ts
const street = user?.address?.location?.street;
```

If any step is `null` or `undefined`, the result is `undefined`.

---

## Optional chaining with arrays

Use `?.[]` for arrays.

```ts
const users = undefined;
console.log(users?.[0]); // undefined — no crash
```

---

## Optional chaining with functions

Use `?.()` if the function might not exist.

```ts
type User = { name: string; greet?: () => void };

const user: User = { name: "Sakif" };
user.greet?.(); // Does nothing — does not crash
```

This is great for optional callbacks.

---

## Nullish coalescing (`??`)

`??` gives a **default value** when the left side is `null` or `undefined`.

```ts
const name = null;
const display = name ?? "Guest";
console.log(display); // "Guest"
```

```ts
const age = 0;
const display = age ?? 18;
console.log(display); // 0 (zero is NOT null/undefined)
```

---

## `??` vs `||`

This is the most important thing to understand here.

| Operator | Returns right side when left is... |
| -------- | ---------------------------------- |
| `\|\|`   | falsy (`null`, `undefined`, `0`, `""`, `false`, `NaN`) |
| `??`     | only `null` or `undefined`         |

**Example showing the difference:**

```ts
const count = 0;

console.log(count || 10); // 10  — wrong! 0 is a valid count
console.log(count ?? 10); // 0   — correct!
```

```ts
const name = "";

console.log(name || "Guest"); // "Guest"
console.log(name ?? "Guest"); // ""
```

**Rule:** Use `??` when `0`, `""`, or `false` are **valid** values.
Use `||` when you really want any falsy value to mean "missing".

---

## Combining `?.` and `??`

Together, they are powerful.

```ts
const user = { name: "Sakif", address: undefined };

const city = user?.address?.city ?? "Unknown";
console.log(city); // "Unknown"
```

This reads as: "try to get the city; if anything is missing, use
'Unknown'."

---

## Nullish assignment (`??=`)

This assigns a value **only if** the current value is `null` or
`undefined`.

```ts
let config: { theme?: string } = {};

config.theme ??= "dark";
console.log(config.theme); // "dark"

config.theme ??= "light";
console.log(config.theme); // "dark" (not changed)
```

Same as:

```ts
config.theme = config.theme ?? "dark";
```

---

## Real world examples

**React props with defaults:**

```ts
type Props = { title?: string; count?: number };

function Header({ title, count }: Props) {
    const safeTitle = title ?? "Home";
    const safeCount = count ?? 0;
    return <h1>{safeTitle} ({safeCount})</h1>;
}
```

**API response:**

```ts
const response = await fetch("/api/user");
const data = await response.json();

const email = data?.user?.contact?.email ?? "no email";
```

**Calling an optional callback:**

```ts
type Props = { onPress?: () => void };

function Button({ onPress }: Props) {
    return <button onClick={() => onPress?.()}>Click</button>;
}
```

**Navigation params:**

```ts
const { params } = useRoute();
const id = params?.id ?? 0;
```

---

## Quick reference table

| Operator | Name                  | Use                                  |
| -------- | --------------------- | ------------------------------------ |
| `?.`     | Optional chaining     | Safely access nested properties      |
| `?.[]`   | Optional array index  | Safely access array items            |
| `?.()`   | Optional call         | Safely call a function               |
| `??`     | Nullish coalescing    | Default when null/undefined only     |
| `??=`    | Nullish assignment    | Assign only if null/undefined        |
| `\|\|`   | Logical OR            | Default when any falsy value         |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Safely accessing `user.address.city` when address may be undefined   | `?.`                      | `user.address?.city`                     |
| Calling an optional callback (`onPress?`)                            | `?.()`                    | `onPress?.()`                            |
| Accessing array element when array may be undefined                  | `?.[]`                    | `arr?.[0]`                               |
| Default value when result might be null/undefined                    | `??`                      | `name ?? "Guest"`                        |
| `0` is a valid value — don't replace it                              | `??` (NOT `\|\|`)         | `count ?? 10`                            |
| Empty string `""` is valid — don't replace it                        | `??` (NOT `\|\|`)         | `text ?? "default"`                      |
| Want to replace ANY falsy value (incl. `0`, `""`, `false`)           | `\|\|`                    | `name \|\| "Guest"`                      |
| Set a default config value if not already set                        | `??=`                     | `config.theme ??= "dark"`                |
| Reading deeply nested JSON from API                                  | `?.` chained + `??`       | `data?.user?.email ?? ""`                |
| React Native `useRoute().params?.id`                                 | `?.`                      | `params?.id ?? 0`                        |
| Calling a method that might not exist on the object                  | `?.()`                    | `analytics?.track?.()`                   |
| Avoid `if (x !== undefined && x !== null)` boilerplate               | `?.` or `??`              | (cleaner syntax)                         |

---

## Running the examples

From this folder:

```bash
npx ts-node "optional-chaining.ts"
npx ts-node "nullish.ts"
```
