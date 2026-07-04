# Loops in TypeScript

TypeScript uses the same loops as JavaScript (TS is just JS + types).

| File | Loop | Use when |
|---|---|---|
| `for-loop.ts` | `for` | You need an index / fixed count |
| `while-loop.ts` | `while` | Run until a condition changes (unknown count) |
| `do-while-loop.ts` | `do...while` | Must run **at least once** |
| `for-of-loop.ts` | `for...of` | Loop over array **values** ✅ |
| `for-in-loop.ts` | `for...in` | Loop over object **keys** |
| `array-methods.ts` | `forEach` / `map` / `filter` | Clean array processing |

## Quick rules
- `for...of` → arrays (values), `for...in` → objects (keys).
- `forEach` can't `break`/`continue` and returns `undefined` — use a real loop to stop early, `map` to get a new array.
- TS type-checks your loop variables automatically.

## Run a file
```bash
npx ts-node "8. loop/for-of-loop.ts"
```

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Loop a fixed number of times (1 to 10)                               | `for`                     | `for (let i = 0; i < 10; i++)`           |
| Need the index of each element                                       | `for`                     | `for (let i = 0; i < arr.length; i++)`   |
| Loop while a condition is true (queue, polling)                      | `while`                   | `while (queue.length > 0)`               |
| Must run the body at least once (menu prompts)                       | `do...while`              | `do { ask() } while (!valid)`            |
| Loop through every item of an array (value only)                     | `for...of`                | `for (const item of arr)`                |
| Loop through object keys                                             | `for...in`                | `for (const key in obj)`                 |
| Loop through both key + value of an object                           | `Object.entries`          | `for (const [k, v] of Object.entries(obj))` |
| Run side-effects on each element (logging, DOM updates)              | `.forEach()`              | `arr.forEach(x => console.log(x))`       |
| Transform each element into a new array                              | `.map()`                  | `arr.map(x => x * 2)`                    |
| Filter elements out                                                  | `.filter()`               | `arr.filter(x => x > 0)`                 |
| Reduce array to a single value (sum, max)                            | `.reduce()`               | `arr.reduce((a, b) => a + b, 0)`         |
| Need to break / continue / early exit                                | `for` / `for...of`        | (forEach can't break)                    |
| Loop a `Map` or `Set`                                                | `for...of`                | `for (const [k, v] of map)`              |
| Async work in sequence per item                                      | `for...of` + `await`      | `for (const id of ids) await fetch(id)`  |
| Async work in parallel per item                                      | `Promise.all(map)`        | `await Promise.all(ids.map(fetchOne))`   |
