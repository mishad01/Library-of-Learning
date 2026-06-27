// ============================================================
// Built-In / Primitive Types in TypeScript
// number, string, boolean, null, undefined, symbol, bigint
// Plus special types: any, unknown, void, never
// ============================================================


// ------------------------------------------------------------
// 1. number
// Covers all numbers — integers, decimals, negatives.
// No int / float / double separation.
// ------------------------------------------------------------
let age: number = 25;
let price: number = 9.99;
let temp: number = -10;


// ------------------------------------------------------------
// 2. string
// Covers all text — single char or whole sentences. No char type.
// ------------------------------------------------------------
let letter: string = 'A'; // single char — still just a string
let userName: string = "John";
let msg: string = `Hello ${userName}, welcome to TypeScript!`; // template literal


// ------------------------------------------------------------
// 3. boolean
// Only true or false.
// ------------------------------------------------------------
let isLoggedIn: boolean = true;


// ------------------------------------------------------------
// 4. null
// Intentionally empty value (you set it).
// ------------------------------------------------------------
let user: string | null = null;


// ------------------------------------------------------------
// 5. undefined
// Variable declared but not assigned yet.
// ------------------------------------------------------------
let score: number | undefined;
let u: undefined = undefined;


// ------------------------------------------------------------
// 6. symbol
// A unique, immutable identifier. Rarely used in everyday code —
// mainly for advanced patterns like custom object keys.
// ------------------------------------------------------------
const id = Symbol("id");
const id2 = Symbol("id");
// console.log(id === id2); // false — always unique


// ------------------------------------------------------------
// 7. bigint
// For integers too large for number (beyond 2^53). Use the `n` suffix.
// ------------------------------------------------------------
let bigNum: bigint = 9007199254740991n;


// ============================================================
// Putting primitives together
// ============================================================
let userId: number;
let firstName: string;
let lastName: string;
let isActivated: boolean;

userId = 12345;
firstName = "John";
lastName = "Doe";
isActivated = true;

userId.toString();       // OK — number has toString()
firstName.toUpperCase(); // OK — string has toUpperCase()
isActivated.valueOf();   // OK — boolean has valueOf()

console.log(`User ID: ${userId}`);
console.log(`Name: ${firstName} ${lastName}`);
console.log(`Activated: ${isActivated}`);


// ------------------------------------------------------------
// void
// Used for functions that don't return a value.
// ------------------------------------------------------------
function display(): void {
    console.log(`User ID: ${userId}`);
}

display();


// ============================================================
// any
// Not a primitive — a special type that turns OFF type checking.
// Convenient, but unsafe: errors slip through to runtime.
// ============================================================
let x: any = 5;
x = "hello"; // OK
x = true;    // OK
x = null;    // OK
let password: any;

let a: any = "hello";
a.toUpperCase(); // ✅ No error — but also no safety
// a.fly();      // ✅ No compile error — but CRASHES at runtime!


// ============================================================
// unknown
// The type-safe counterpart of `any`.
// You must narrow the type before using it.
// ============================================================
let input: unknown = "hello";

// input.toUpperCase(); // ❌ Error — TypeScript won't allow direct use

// ✅ Must check the type first
if (typeof input === "string") {
    input.toUpperCase(); // Now TypeScript knows it's a string
}

let b: unknown = "hello";
// b.toUpperCase(); // ❌ Error — forces you to check first
// b.fly();         // ❌ Error — caught at compile time, not runtime

// Real use case
function processInput(value: unknown) {
    if (typeof value === "string") {
        console.log(value.toUpperCase());
    } else if (typeof value === "number") {
        console.log(value * 2);
    } else {
        console.log("Unknown type");
    }
}

processInput("hello"); // HELLO
processInput(42);      // 84
processInput(true);    // Unknown type


// ============================================================
// never
// Represents values that never occur.
// Think: "This point in code should never be reached."
// ============================================================

// Use case 1 — a function that always throws:
function throwError(msg: string): never {
    throw new Error(msg);
    // no return needed — TypeScript understands execution stops here
}

// Use case 2 — an infinite loop:
function runForever(): never {
    while (true) {
        // never returns
    }
}

// Use case 3 (most important) — exhaustive checks:
// You want TypeScript to warn you if you forget to handle a union case.
type Shape = "circle" | "square" | "triangle";

function getArea(shape: Shape) {
    if (shape === "circle") {
        return "circle area";
    } else if (shape === "square") {
        return "square area";
    } else if (shape === "triangle") {
        return "triangle area";
    } else {
        // If every case is handled, `shape` is narrowed to `never` here.
        // Add a new shape to the union and forget to handle it,
        // and TypeScript errors right here ✅
        const exhaustiveCheck: never = shape;
        return exhaustiveCheck;
    }
}


// ============================================================
// Why do we even need `never`?
// "Can't I just return a string message instead?"
// ============================================================
//
// Returning a string hides the truth:
//
//   function throwError(msg: string): string {
//       throw new Error(msg);
//       return "never reaches here"; // fake return you'd be forced to add
//   }
//
//   let name: string = throwError("something broke");
//   // TypeScript THINKS `name` is a string — but the function threw!
//   // This causes silent bugs.
//
// With `never`, TypeScript knows the function never returns, so it can
// reason correctly about the code that follows a call to it:
//
//   function getUser(id: number): string {
//       if (id <= 0) {
//           throwError("Invalid ID"); // TS knows execution stops here
//       }
//       return "John"; // reached only when id > 0
//   }
//
// If throwError returned `string` instead of `never`, TypeScript would
// think execution continues after it and might complain that getUser
// doesn't always return a string.
