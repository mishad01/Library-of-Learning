# Async / Await and Promises in TypeScript

`Promise`, `async`, and `await` are how modern JavaScript and TypeScript
deal with **asynchronous code** — things that take time, like API calls,
file reads, or timers. TypeScript adds type safety on top, so you always
know the shape of the data you get back.

---

## Table of Contents

1. [What is a Promise?](#what-is-a-promise)
2. [The three states of a Promise](#the-three-states-of-a-promise)
3. [Typing a Promise](#typing-a-promise)
4. [`async` functions](#async-functions)
5. [`await` keyword](#await-keyword)
6. [Error handling with `try / catch`](#error-handling-with-try--catch)
7. [Running promises together](#running-promises-together)
8. [`async` in arrow functions](#async-in-arrow-functions)
9. [`Awaited<T>` utility type](#awaitedt-utility-type)
10. [Real world examples](#real-world-examples)
11. [Quick reference table](#quick-reference-table)

---

## What is a Promise?

A **Promise** is an object that represents a value that is not ready
yet. It will be ready **later** — either with a result, or with an
error.

Think of it like ordering food. You get a receipt (the promise) right
away, but the food (the value) comes later.

---

## The three states of a Promise

1. **Pending** — waiting for the result
2. **Fulfilled** — the result is ready
3. **Rejected** — something went wrong

---

## Typing a Promise

A promise type looks like `Promise<T>`, where `T` is the type of the
result.

```ts
const p1: Promise<string> = Promise.resolve("hello");
const p2: Promise<number> = Promise.resolve(42);
const p3: Promise<void>   = Promise.resolve();
```

If a function returns a promise, you type the return as `Promise<T>`.

```ts
function getName(): Promise<string> {
    return Promise.resolve("Sakif");
}
```

---

## `async` functions

An `async` function **always returns a Promise**, even if you do not
write it.

```ts
async function getName(): Promise<string> {
    return "Sakif"; // wrapped in Promise<string> automatically
}
```

You do not need to write `Promise.resolve()` — `async` does it for you.

---

## `await` keyword

`await` waits for a promise to finish and gives you the value. It can
**only** be used inside an `async` function.

```ts
async function showName() {
    const name = await getName(); // waits, then assigns the string
    console.log(name);
}
```

Without `await`, you would get the promise object instead of the value:

```ts
const name = getName();        // Promise<string>
const name2 = await getName(); // string
```

---

## Error handling with `try / catch`

If a promise fails, you catch the error.

```ts
async function loadUser() {
    try {
        const res = await fetch("/api/user");
        const data = await res.json();
        console.log(data);
    } catch (error) {
        console.error("Something went wrong:", error);
    }
}
```

In TypeScript, the error inside `catch` is `unknown` by default. You
must narrow it:

```ts
catch (error) {
    if (error instanceof Error) {
        console.log(error.message);
    }
}
```

---

## Running promises together

**`Promise.all`** — wait for all to finish. Fails if any one fails.

```ts
const [user, posts] = await Promise.all([
    fetchUser(),
    fetchPosts(),
]);
```

**`Promise.allSettled`** — wait for all, but never fail. Get results
and errors together.

```ts
const results = await Promise.allSettled([fetchUser(), fetchPosts()]);
```

**`Promise.race`** — return the first one to finish (success or fail).

```ts
const first = await Promise.race([slowApi(), fastApi()]);
```

---

## `async` in arrow functions

```ts
const getUser = async (id: number): Promise<User> => {
    const res = await fetch(`/api/user/${id}`);
    return res.json();
};
```

---

## `Awaited<T>` utility type

`Awaited<T>` removes the `Promise` wrapper from a type.

```ts
type A = Promise<string>;
type B = Awaited<A>; // string
```

This is helpful when you want the result type of an `async` function:

```ts
async function getUser() {
    return { id: 1, name: "Sakif" };
}

type User = Awaited<ReturnType<typeof getUser>>;
// { id: number; name: string }
```

---

## Real world examples

**Fetching data in React Native:**

```ts
async function fetchUser(id: number): Promise<User> {
    const res = await fetch(`https://api.example.com/users/${id}`);
    if (!res.ok) {
        throw new Error("Failed to fetch user");
    }
    return res.json();
}
```

**Calling it inside `useEffect`:**

```ts
useEffect(() => {
    const loadData = async () => {
        try {
            const user = await fetchUser(1);
            setUser(user);
        } catch (e) {
            console.error(e);
        }
    };
    loadData();
}, []);
```

**Multiple parallel calls:**

```ts
async function loadDashboard() {
    const [profile, notifications, messages] = await Promise.all([
        fetchProfile(),
        fetchNotifications(),
        fetchMessages(),
    ]);
    return { profile, notifications, messages };
}
```

---

## Quick reference table

| Concept             | Example                                        | Meaning                              |
| ------------------- | ---------------------------------------------- | ------------------------------------ |
| `Promise<T>`        | `Promise<string>`                              | A future value of type T             |
| `async function`    | `async function f(): Promise<T>`               | Always returns a promise             |
| `await`             | `const x = await f()`                          | Wait for a promise to finish         |
| `try / catch`       | Wrap `await` calls                             | Handle rejected promises             |
| `Promise.all`       | `await Promise.all([a, b])`                    | Wait for all; fail if any fails      |
| `Promise.allSettled`| `await Promise.allSettled([a, b])`             | Wait for all; never throws           |
| `Promise.race`      | `await Promise.race([a, b])`                   | First to finish wins                 |
| `Awaited<T>`        | `Awaited<Promise<string>>` → `string`          | Strip the Promise wrapper            |

---

## When to use this? — Scenario Guide

| Scenario / What you want to do                                       | Use this                  | Example                                  |
| -------------------------------------------------------------------- | ------------------------- | ---------------------------------------- |
| Fetching from an API                                                 | `async/await` + `fetch`   | `const r = await fetch(url)`             |
| Reading a file or making any I/O call                                | `async/await`             | `await fs.readFile(...)`                 |
| Function returns a future value                                      | `Promise<T>` return type  | `function f(): Promise<User>`            |
| Wrapping risky async calls                                           | `try / catch`             | wrap `await` in `try`                    |
| Catching error in TS — type is `unknown`                             | `if (e instanceof Error)` | narrow before using `.message`           |
| Running multiple unrelated API calls in parallel                     | `Promise.all([a, b])`     | `await Promise.all([userP, postsP])`     |
| Same as above but you want all results even if some fail             | `Promise.allSettled`      | `await Promise.allSettled([...])`        |
| Whichever finishes first wins (timeout pattern)                      | `Promise.race`            | `Promise.race([fetch(), timeout()])`     |
| Async work in `useEffect`                                            | Inner async fn + call     | `(async () => { ... })()`                |
| Sequential async work (each depends on previous)                     | `for...of` + `await`      | `for (const id of ids) await fetchOne(id)` |
| Parallel async work over a list                                      | `Promise.all(map)`        | `await Promise.all(ids.map(fetchOne))`   |
| Want resolved type of an async function                              | `Awaited<ReturnType<>>`   | `Awaited<ReturnType<typeof getUser>>`    |
| Return early after a delay                                           | `await new Promise(setTimeout)` | `await new Promise(r => setTimeout(r, 1000))` |
| Async arrow function as a hook callback                              | `const fn = async () =>`  | `const load = async () => { ... }`       |

---

## Running the examples

From this folder:

```bash
npx ts-node "async-await.ts"
```
