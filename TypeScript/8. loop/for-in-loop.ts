// for...in — loop over KEYS (object properties)
// Gives you the keys/indexes, NOT the values.
// Use for...in for OBJECTS.

const person = {
  name: "Sakif",
  age: 23,
};
const test = {
  name: "test",
  age: 25,
}
for (const key in person) {
  console.log(key); // "name", "age"
  console.log(person[key as keyof typeof person]); // "Sakif", 23
}

// ⚠️ Rule of thumb:
//   for...in  → objects (keys)
//   for...of  → arrays  (values)

for (const key in test){
  console.log(test[key as keyof typeof test]);
}