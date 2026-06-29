// for loop — classic counting loop
// Use when you know HOW MANY times to run, or you need an index.
// Three parts:  start ; condition ; step

for (let i = 0; i < 5; i++) {
  console.log(i); // 0 1 2 3 4
}

// Looping over an array using its index
const colors = ["red", "green", "blue"];

for (let i = 0; i < colors.length; i++) {
  console.log(i, colors[i]); // 0 red, 1 green, 2 blue
}

// break — stops the loop entirely
for (let i = 0; i < 5; i++) {
    if (i === 3) break;
    console.log(i); // 0, 1, 2 — stops before 3
}

// continue — skips the current iteration and moves to the next
for (let i = 0; i < 5; i++) {
    if (i === 2) continue;
    console.log(i); // 0, 1, 3, 4 — skips 2
}
