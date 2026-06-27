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
