// 1. display(): void { ... } — a method
// This syntax only works inside a class (or an object). 
// It's a method — a function that belongs to an object/class.


class Student {
  userName = "Sakif";
  age = 23;
  studentId = 101;

  display(): void {              // ← method, lives inside the class
    console.log(`username: ${this.userName}, age: ${this.age}`);
  }
}

// Notice: 
// no function keyword, no =, no const. That shorthand name() {} is special syntax allowed inside classes and objects only.
// You cannot write that at the top level of a file — it would be a syntax error.


// 2. const userInfo1 = () => { } — an arrow function in a variable
// This is a standalone function stored in a variable. It's not attached to any class. This is what you use at the top level of a file.


const userInfo1 = () => {
  console.log("hello");
};

// userInfo1();   // call it by the variable name
// Here () => {} is the arrow function (the actual function), and const userInfo1 = just gives it a name so you can call it later.

const test = ()=>{
    console.log("test");
}

console.log(test);  // prints the function definition
test();              // prints "test"

let userInfo2 : ()=> void; 

 userInfo2 = () => {
  console.log("hello");
};


let userInfo3 : ()=> string; 

 userInfo3 = () => {
  return "hello";
};


let userInfo4 : (x: string, y: number)=> any; 

 userInfo4 = (x, y) => {
  return x + y;
};

console.log(userInfo4("sakif ", 25));  // prints "sakif25"


// ─── Regular function declaration ────────────────────────────────────────────
function add(a: number, b: number): number {
    return a + b;
}
console.log(add(5, 3)); // 8


// ─── Optional parameters ( ? ) ───────────────────────────────────────────────
// age is optional — caller can skip it
function displayUser(name: string, age?: number): void {
    if (age !== undefined) {
        console.log(`${name}, age: ${age}`);
    } else {
        console.log(`${name}, age: not provided`);
    }
}
displayUser("Sakif", 25); // Sakif, age: 25
displayUser("Mishad");    // Mishad, age: not provided


// ─── Default parameters ──────────────────────────────────────────────────────
// if caller doesn't pass greeting, it defaults to "Hello"
function greet(name: string, greeting: string = "Hello"): string {
    return `${greeting}, ${name}`;
}
console.log(greet("Sakif"));          // Hello, Sakif
console.log(greet("Sakif", "Hi"));    // Hi, Sakif


// ─── Rest parameters ─────────────────────────────────────────────────────────
// accepts any number of arguments as an array
function sum(...nums: number[]): number {
    return nums.reduce((acc, n) => acc + n, 0);
}
console.log(sum(1, 2, 3));       // 6
console.log(sum(10, 20, 30, 40)); // 100


// ─── Function overloading ─────────────────────────────────────────────────────
// same function name, different parameter types
// the last signature is the actual implementation
function format(value: string): string;
function format(value: number): string;
function format(value: any): string {
    return String(value);
}
console.log(format(123));     // "123"
console.log(format("hello")); // "hello"


// ─── Higher-order functions ───────────────────────────────────────────────────
// a function that takes another function as a parameter
function applyOperation(a: number, b: number, operation: (x: number, y: number) => number): number {
    return operation(a, b);
}

const multiply = (x: number, y: number): number => x * y;

console.log(applyOperation(5, 3, add));       // 8  — uses add function
console.log(applyOperation(5, 3, multiply));  // 15 — uses multiply function


// ─── never return type ────────────────────────────────────────────────────────
// for functions that never return — they always throw or run forever
function throwError(msg: string): never {
    throw new Error(msg);
}

function getUser(id: number): string {
    if (id <= 0) {
        throwError("Invalid ID"); // TypeScript knows: execution stops here
    }
    return "Sakif"; // TypeScript knows this is only reached if id > 0
}
console.log(getUser(1));  // "Sakif"
// getUser(-1);           // throws Error: Invalid ID