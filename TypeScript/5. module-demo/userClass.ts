export class User {
    constructor(public userName: string, public age: number) { }

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}`);
    }
}


/*
Each file is its own private scope

In TypeScript (and modern JavaScript / ES modules),
every file is a module, and everything you declare inside a file is private to that file unless you explicitly say otherwise.

So if you have:
// math.ts
function add(a: number, b: number) {
  return a + b;
}

That add lives only inside math.ts. No other file can see it. It's like a locked room — what's inside stays inside.

export is opening a door
export is how you declare: "this thing is part of my file's public API — other files are allowed to use it."

// math.ts
export function add(a: number, b: number) {
  return a + b;
}
And import is the other file walking through that door:
// index.ts
import { add } from "./math";
add(2, 3);


Why was it designed this way?
A few real reasons:
Avoid naming collisions / global pollution. In the old days (pre-modules), everything dumped into one shared global namespace. Two files both declaring add would clash. With modules, your add is yours — no conflict.

Explicit dependencies. When you read a file's import lines, you immediately know exactly what it depends on. The code is self-documenting about its connections.

Encapsulation. You can have helper functions that are implementation details — you don't export them, so nobody outside can depend on them. This lets you change internals freely without breaking other files.


// math.ts
function validate(n: number) {  // private helper, NOT exported
  if (isNaN(n)) throw new Error("not a number");
}

export function add(a: number, b: number) {  // public
  validate(a);
  validate(b);
  return a + b;
}
Tooling / tree-shaking. Because exports are explicit, bundlers can detect unused exports and strip them out, making your final bundle smaller.

*/