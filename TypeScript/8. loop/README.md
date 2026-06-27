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
