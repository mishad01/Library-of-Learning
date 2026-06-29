// Array methods (functional loops)
// Not keyword-loops, but the most common way to "loop" over arrays in real code.

const nums = [1, 2, 3];

// forEach — run code once for EACH item. Returns nothing (undefined).
//           Use it to DO something (log, save). You CANNOT break out of it.
nums.forEach((value, index) => {
  console.log(index, value); // 0 1, 1 2, 2 3
});

// map — TRANSFORM each item into a NEW array
const doubled = nums.map((n) => n * 2);
console.log(doubled); // [2, 4, 6]

// filter — KEEP only the items that pass a test → new array
const evens = nums.filter((n) => n % 2 === 0);
console.log(evens); // [2]

// ⚠️ forEach cannot break/continue, and returns undefined.
//    Need to stop early?      → use a normal for / for...of loop
//    Need a new array back?   → use map (not forEach)

// reduce — ACCUMULATE all items into a single value
const total = nums.reduce((acc, n) => acc + n, 0);
console.log(total); // 6

// find — returns the FIRST item that passes the test (or undefined)
const firstOver1 = nums.find(n => n > 1);
console.log(firstOver1); // 2

// findIndex — returns the INDEX of the first item that passes (or -1)
const firstOver1Index = nums.findIndex(n => n > 1);
console.log(firstOver1Index); // 1

// some — returns true if AT LEAST ONE item passes the test
const hasEven = nums.some(n => n % 2 === 0);
console.log(hasEven); // true

// every — returns true if ALL items pass the test
const allPositive = nums.every(n => n > 0);
console.log(allPositive); // true
