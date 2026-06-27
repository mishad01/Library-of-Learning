// do...while loop — runs AT LEAST ONCE
// The condition is checked AFTER the body runs,
// so the body always executes at least one time.

let i = 0;

do {
  console.log(i); // 0 1 2 3 4
  i++;
} while (i < 5);

// Even if the condition is false from the start, it still runs once:
let n = 10;

do {
  console.log("runs once even though 10 < 5 is false"); // printed once
} while (n < 5);
