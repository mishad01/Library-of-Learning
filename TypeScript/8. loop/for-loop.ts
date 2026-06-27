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
