// for...of — loop over VALUES (arrays, strings)
// The cleanest way to walk through the items of an array.
// Use for...of for ARRAYS.

const fruits = ["apple", "banana", "mango"];

for (const fruit of fruits) {
  console.log(fruit); // apple, banana, mango
}

// Works on strings too (each character)
for (const char of "hi") {
  console.log(char); // h, i
}

// TypeScript bonus: it knows `fruit` is a string automatically
for (const fruit of fruits) {
  console.log(fruit.toUpperCase()); // ✅ APPLE, BANANA, MANGO
  // fruit * 2;                      // ❌ TS error — can't multiply a string
}
