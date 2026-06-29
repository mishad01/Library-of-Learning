# Modules in TypeScript

## Why Modules Exist

Every file in TypeScript is its own **private scope**. Anything declared inside a file stays inside that file unless you explicitly share it.

```ts
// math.ts
function add(a: number, b: number) { return a + b; }
// add() is invisible to all other files
```

This prevents naming collisions, makes dependencies explicit, and allows encapsulation of implementation details.

---

## `export` — Opening the Door

`export` declares that something is part of a file's public API:

```ts
// math.ts
export function add(a: number, b: number) { return a + b; }
```

---

## `import` — Walking Through the Door

```ts
// index.ts
import { add } from "./math";
add(2, 3); // ✅
```

---

## Named Exports & Imports

Export multiple things from one file:

```ts
// student.ts
export let studentName: string = "Sakif";
export let studentAge: number = 25;
export function displayInfo(): void { console.log(studentName); }
```

Import them by name (with curly braces):

```ts
import { studentName, studentAge, displayInfo } from "./student";
```

Import with an alias:

```ts
import { studentAge as age } from "./student";
```

---

## Namespace Import (`import *`)

Import everything from a file under one name:

```ts
import * as Student from "./student";

console.log(Student.studentName);
console.log(Student.studentAge);
Student.displayInfo();
```

---

## Default Export

A file can have only **one** default export. Import it without curly braces and name it anything:

```ts
// student.ts
export default function displayInfo3(): void {
    console.log("Default export");
}
```

```ts
// index.ts
import displayInfo3 from "./student";  // no curly braces, any name works
displayInfo3();
```

---

## `export type` — Type-Only Export

Exports only a TypeScript type — erased at runtime, zero JavaScript output:

```ts
// student.ts
export type StudentType = {
    name: string;
    age: number;
    studentId: number;
};
```

```ts
// index.ts
import { StudentType } from "./student";
const newStudent: StudentType = { name: "Mishad", age: 22, studentId: 101 };
```

---

## Re-export (Barrel Export)

Instead of importing from multiple files individually, create one central file that re-exports everything:

```ts
// index.ts (barrel file)
export { studentName, displayInfo } from "./student";
export { User } from "./userClass";
```

Now other files only need one import line:

```ts
import { studentName, User } from "./module-demo";
```

---

## Private Helpers (Not Exported)

Functions that are implementation details should NOT be exported. This keeps them hidden from outside:

```ts
function validate(n: number) {  // private — not exported
    if (isNaN(n)) throw new Error("not a number");
}

export function add(a: number, b: number) {  // public
    validate(a);
    validate(b);
    return a + b;
}
```

---

## Summary

| Syntax | What it does |
|---|---|
| `export function foo()` | Named export |
| `export default function foo()` | Default export (one per file) |
| `export type Foo = {...}` | Type-only export |
| `import { foo } from "./file"` | Named import |
| `import foo from "./file"` | Default import |
| `import * as Foo from "./file"` | Namespace import |
| `export { foo } from "./file"` | Re-export (barrel) |
