// ============================================================
// TypeScript Tuples
// ============================================================
// A tuple is an array with a FIXED number of elements, where each
// position has its own specific type. Order matters. Read top to
// bottom alongside the README.


// ------------------------------------------------------------
// 1. Basic tuple
// ------------------------------------------------------------
// Each position is locked to a type, in order.

let users: [number, string];
users = [101, "sakif"];
// users = ["sakif", 101]; // ERROR - wrong order, types do not match positions

console.log(users[0]); // 101
console.log(users[1]); // "sakif"


// ------------------------------------------------------------
// 2. The push() limitation
// ------------------------------------------------------------
// TypeScript does NOT stop push() from adding extra elements,
// even though it breaks the fixed length. This is a known gap.
// Use a readonly tuple (section 4) to prevent it.

users.push(102, "anis"); // no error, but the tuple now has more than 2 elements
console.log(users);


// ------------------------------------------------------------
// 3. Named tuple elements
// ------------------------------------------------------------
// Labels make the meaning of each position clear. Behavior is
// identical - the labels are only for readability.

let employee: [name: string, age: number] = ["Sakif", 25];
console.log(employee[0]); // "Sakif"
console.log(employee[1]); // 25


// ------------------------------------------------------------
// 4. Readonly tuple
// ------------------------------------------------------------
// Prevents any modification - and fixes the push() problem.

let point: readonly [number, number] = [10, 20];
// point.push(30); // ERROR - cannot modify a readonly tuple
// point[0] = 99;  // ERROR - cannot reassign elements


// ------------------------------------------------------------
// 5. Optional tuple elements
// ------------------------------------------------------------
// A trailing element marked with ? may be present or omitted.

let user1: [number, string, string?] = [1, "Sakif"];                  // third element omitted
let user2: [number, string, string?] = [2, "Anis", "anis@gmail.com"]; // third element present


// ------------------------------------------------------------
// 6. Tuple destructuring
// ------------------------------------------------------------
// Pull each position into its own named variable - the most
// common way to consume a tuple.

let userData: [number, string] = [101, "Sakif"];
const [id, name] = userData;
console.log(id);   // 101
console.log(name); // "Sakif"


// ------------------------------------------------------------
// 7. Tuple as a function return type
// ------------------------------------------------------------
// A very practical use: return several values at once.
// Real-world example: React's useState returns [value, setter].

function getUser(): [number, string] {
  return [101, "Sakif"];
}

const [userId, userName] = getUser();
console.log(userId);   // 101
console.log(userName); // "Sakif"
