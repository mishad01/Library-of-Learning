// 1. union ( | ): 
// Union Type - more than one type for variable or function parameter.
// Program - odd/even for number and string to give idea about this union concept.
let userId = 'Mishad';

function userIdDataType (userId: string | number){
    console.log(typeof userId)
}

userIdDataType('123'); 
userIdDataType(123); 

//Arrow fucntion
const isEven = (num : number | string )=>{
    if(typeof(num)==='number'){
        if(num%2===0){
            return 'Even'
        }else{
            return 'Odd'
        }
    }else{
        num = Number(num)
        if(num%2===0){
            return 'Even'
        }else{
            return 'Odd'
        } 
    }
}

console.log(isEven(5));
console.log(isEven(10));
console.log(isEven("8"))
console.log(isEven("12"))


// 2. Union with more than 2 types
let input: string | number | boolean;
input = "hello";  // ✅
input = 42;       // ✅
input = true;     // ✅


// 3. Literal types — only specific values allowed
type Direction = "left" | "right" | "up" | "down";
let move: Direction = "left";
// move = "diagonal"; // ❌ Error — not in the list

type StatusCode = 200 | 404 | 500;
let code: StatusCode = 200; // ✅
// code = 999; // ❌ Error

type Status = "pending" | "approved" | "rejected";
function updateStatus(status: Status) {
    console.log("Status updated to:", status);
}
updateStatus("approved"); // ✅
// updateStatus("maybe"); // ❌ Error — catches invalid values at compile time


// 4. Union in return type
function parse(input: string): number | null {
    const result = Number(input);
    return isNaN(result) ? null : result;
}
console.log(parse("42"));   // 42
console.log(parse("abc"));  // null


// 5. Union with object types
type Dog = { breed: string };
type Cat = { lives: number };

let pet: Dog | Cat = { breed: "Labrador" };
// pet = { name: "Buddy" }; // ❌ Error — doesn't match Dog or Cat shape

// Problem: TypeScript doesn't know which one it is
// console.log(pet.breed); // ❌ Error — what if pet is a Cat?
// console.log(pet.lives); // ❌ Error — what if pet is a Dog?

// Solution: narrow using the `in` operator
if ("breed" in pet) {
    // TypeScript knows: this must be a Dog
    console.log(pet.breed); // ✅
} else {
    // TypeScript knows: this must be a Cat
    console.log(pet.lives); // ✅
}
