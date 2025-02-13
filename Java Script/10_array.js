// Declare an array named 'arr' with elements from 1 to 10
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Uncommenting the next line would replace the first element of the array with "Bro"
// arr[0] = "Bro";

// Log the initial array to the console
console.log(arr);

// Loop through the array using a for loop (currently commented out)
// It would log each element of the array one by one
// for (var i = 0; i < arr.length; i++) {
//     console.log(arr[i]);
// }

// Remove the last element from the array using `pop()` method
arr.pop();
console.log(arr); // Logs the array after removing the last element

// Add the number 5 to the end of the array using `push()` method
arr.push(5);
// Add the number 11 to the end of the array using `push()` method
arr.push(11);
console.log(arr); // Logs the array after adding 5 and 11 to the end

// Remove the first element from the array using `shift()` method
arr.shift(); // This shifts all elements to the left and reduces the array size by 1
console.log(arr); // Logs the array after removing the first element

// Add 101 to the start of the array using `unshift()` method
arr.unshift(101); // This shifts all elements to the right and inserts 101 at index 0
console.log(arr); // Logs the array after adding 101 to the start

// Log a separator string "Slice" to console for better readability
console.log("Slice");

// Slice example (commented out):
// `slice(1, 3)` would create a new array with elements from index 1 to index 2 (not including 3)
// console.log(arr.slice(1, 3));

// Use the `splice()` method to remove 3 elements starting from index 1
// Replace those 3 elements with the string "Test"
arr.splice(1, 3, "Test");
console.log(arr); // Logs the array after the splice operation
