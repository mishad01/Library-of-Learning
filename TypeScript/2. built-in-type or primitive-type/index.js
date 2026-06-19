"use strict";
//Built-In / Primitive Types in TypeScript
//number, string, boolean, null, undefined, symbol, bigint
// 1. number
// Covers all numbers — integers, decimals, negatives. No int, float, double separation.
let age = 25;
let price = 9.99;
let temp = -10;
// 2. string
// Covers all text — single char or whole sentences. No char type.
let letter = 'A'; // single char — still just a string
let userName = "John";
let msg = `Hello ${userName}, welcome to TypeScript!`; // template literal
// 3. boolean
// Only true or false.
let isLoggedIn = true;
// 4. null
// Intentionally empty value (you set it).
let user = null;
// 5. undefined
// Variable declared but not assigned yet.
let score;
let u = undefined;
// 6. symbol
// A unique, immutable identifier. Rarely used in everyday code — mainly for advanced patterns like custom object keys.
const id = Symbol("id");
const id2 = Symbol("id");
//console.log(id === id2); // false — always unique
// 7. bigint
// For integers too large for number (beyond 2^53). Use n suffix.
let bigNum = 9007199254740991n;
// 5. any 
// 'any' is not a primitive — it's a special TypeScript type that turns off type checking for that variable.
let x = 5;
x = "hello"; // OK
x = true; // OK
x = null; // OK
let password;
let userId;
let firstName;
let lastName;
let isActivated;
userId = 12345;
firstName = "John";
lastName = "Doe";
isActivated = true;
userId.toString(); // OK, number has toString method
firstName.toUpperCase(); // OK, string has toUpperCase method
isActivated.valueOf(); // OK, boolean has valueOf method
console.log(`User ID: ${userId}`);
console.log(`Name: ${firstName} ${lastName}`);
console.log(`Activated: ${isActivated}`);
function display() {
    console.log(`User ID: ${userId}`);
}
display();
