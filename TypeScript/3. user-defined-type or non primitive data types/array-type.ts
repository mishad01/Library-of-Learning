// ============================================================
// TypeScript Array Types
// ============================================================
// This file demonstrates the different ways to declare and use
// arrays in TypeScript. Read top to bottom alongside the README.


// ------------------------------------------------------------
// 1. Declaring a typed array
// ------------------------------------------------------------
// Two equivalent syntaxes exist:
//   - Generic syntax:   Array<string>
//   - Shorthand syntax: string[]
// Both mean exactly the same thing. Pick one and stay consistent.

let userNames: Array<string>; // generic syntax
let testArray: Array<number>;

testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];
userNames = ["Sakif", "Anis", "Rubel"];

console.log(userNames[0]); // "Sakif"


// ------------------------------------------------------------
// 2. Union of array types:  string[] | number[]
// ------------------------------------------------------------
// Meaning: the variable is EITHER a whole array of strings
// OR a whole array of numbers. Elements cannot be mixed.
// The "choice" is made at the array level.

let singleTypeArray: string[] | number[];            // shorthand syntax
let testArrayTwoType: Array<number> | Array<string>; // generic syntax (same thing)

singleTypeArray = ["a", "b", "c"];               // OK - all strings
singleTypeArray = [112, 2, 52, 74, 83, 79, 234]; // OK - all numbers
// singleTypeArray = ["a", 1, "b", 2];           // ERROR - mixing not allowed

// Note: because the type is a union, only methods common to both
// array types are available without narrowing.
singleTypeArray.sort();
console.log(singleTypeArray);


// ------------------------------------------------------------
// 3. Array of a union type:  (string | number)[]
// ------------------------------------------------------------
// Meaning: a single array where EACH element can independently
// be a string or a number. Mixing is allowed.
// The "choice" is made at the element level.

let multipleType: (string | number)[];

multipleType = ["a", "b", "c"];  // OK
multipleType = [1, 2, 3];        // OK
multipleType = ["a", 1, "b", 2]; // OK - mixed allowed
multipleType.sort();
console.log(multipleType);


// ------------------------------------------------------------
// 4. Readonly arrays
// ------------------------------------------------------------
// A readonly array cannot be modified after creation.
// const nums: readonly number[] = [1, 2, 3];
// nums.push(4); // ERROR - push does not exist on a readonly array


// ------------------------------------------------------------
// 5. Multidimensional arrays
// ------------------------------------------------------------
// number[][] is "an array of (arrays of numbers)".

let matrix: number[][] = [
  [1, 2, 3],
  [4, 5, 6],
];

console.log("---------------------");
console.log(matrix[0][2]); // 3


// ------------------------------------------------------------
// 6. Common array methods and type inference
// ------------------------------------------------------------
// TypeScript infers result types automatically from the array.

const nums: number[] = [1, 2, 3, 4, 5];

const doubled = nums.map((n) => n * 2);          // inferred as number[]
const evens = nums.filter((n) => n % 2 === 0);   // inferred as number[]
const sum = nums.reduce((acc, n) => acc + n, 0); // inferred as number

console.log("---------------------");
console.log(doubled); // [2, 4, 6, 8, 10]
console.log(evens);   // [2, 4]
console.log(sum);     // 15
