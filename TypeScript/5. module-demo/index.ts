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

// let studentName: string = "Sakif Rahaman"
// let studentAge: number = 25;


function displayInfo():void{
    console.log(Student.studentName);
    console.log(Student.studentAge);
    console.log('${Student.studentName}, ${Student.studentName}');
}

Student.displayInfo2();

 let x  = new User("Sakif", 25);
  x.display();