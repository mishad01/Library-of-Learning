// 1. display(): void { ... } — a method
// This syntax only works inside a class (or an object). 
// It's a method — a function that belongs to an object/class.


class Student {
  userName = "Sakif";
  age = 23;
  studentId = 101;

  display(): void {              // ← method, lives inside the class
    console.log(`username: ${this.userName}, age: ${this.age}`);
  }
}

// Notice: 
// no function keyword, no =, no const. That shorthand name() {} is special syntax allowed inside classes and objects only.
// You cannot write that at the top level of a file — it would be a syntax error.


// 2. const userInfo1 = () => { } — an arrow function in a variable
// This is a standalone function stored in a variable. It's not attached to any class. This is what you use at the top level of a file.


const userInfo1 = () => {
  console.log("hello");
};

// userInfo1();   // call it by the variable name
// Here () => {} is the arrow function (the actual function), and const userInfo1 = just gives it a name so you can call it later.

const test = ()=>{
    console.log("test");
}

console.log(test);  // prints the function definition
test();              // prints "test"

let userInfo2 : ()=> void; 

 userInfo2 = () => {
  console.log("hello");
};


let userInfo3 : ()=> string; 

 userInfo3 = () => {
  return "hello";
};


let userInfo4 : (x: string, y: number)=> any; 

 userInfo4 = (x, y) => {
  return x + y;
};

console.log(userInfo4("sakif ", 25));  // prints "sakif25"