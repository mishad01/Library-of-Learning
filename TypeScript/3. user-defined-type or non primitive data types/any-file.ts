let userName : any; //WE WILL USE ANY WHEN WE ARE NOT SURE, WHAT WILL BE THE USE NAME
userName = "anis";
userName = 121;
userName = true
userName = [10,20]


// What any actually does
// It turns off TypeScript's type checker for that variable. TypeScript stops caring what you do with it:

// Danger of any — no runtime protection
let x: any = "hello";
x.fly();        // No TS error — but crashes at runtime

// any spreading — silent bug
let input: any = "hello";
let name: string = input; // TS allows this, no error

// any in function parameter
function printValue(val: any) {
    console.log(val);
}
printValue("hello");
printValue(123);
printValue([1, 2, 3]);

// Better alternative — unknown
let b: unknown = "hello";
// b.toUpperCase(); // ❌ Error
if (typeof b === "string") {
    b.toUpperCase(); // ✅ Safe
}