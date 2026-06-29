/*
import { studentName,studentAge as age,displayInfo2 } from "./student";

// let studentName: string = "Sakif Rahaman"
// let studentAge: number = 25;


function displayInfo():void{
    console.log(studentName);
    console.log(age);
    console.log('${studentName}, ${studentName}');
}

displayInfo2();

*/

import * as Student from "./student";
import { User } from "./userClass";
import { StudentType } from "./student";       // import type only
import displayInfo3 from "./student";           // default import — no curly braces

// namespace import usage
function displayInfo():void{
    console.log(Student.studentName);
    console.log(Student.studentAge);
}

Student.displayInfo2();

// default import usage
displayInfo3();

// using the exported type
const newStudent: StudentType = {
    name: "Mishad",
    age: 22,
    studentId: 101
};
console.log(newStudent.name);

// named import usage
let x = new User("Sakif", 25);
x.display();


// ─── Re-export (barrel export) ───────────────────────────────────────────────
// Instead of importing from individual files, you can re-export everything
// from one central file so other files only need one import line.
//
// Example — if this were a barrel file (e.g. index.ts of a module):
//
// export { studentName, displayInfo2 } from "./student";
// export { User } from "./userClass";
//
// Then in another file you'd just do:
// import { studentName, User } from "./module-demo";
// instead of importing from two separate files