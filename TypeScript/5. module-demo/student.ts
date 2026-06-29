export let studentName: string = "Sakif Rahaman"
export let studentAge: number = 25;

export function displayInfo2():void{
    console.log(studentName);
    console.log(studentAge);
    console.log('${studentName}, ${studentName}');
}

// export type — exports only a type, not a value (erased at runtime, zero JS output)
export type StudentType = {
    name: string;
    age: number;
    studentId: number;
};

// default export — a file can have only ONE default export
// import without curly braces: import displayInfo3 from "./student"
export default function displayInfo3(): void {
    console.log(`Default export: ${studentName}, ${studentAge}`);
}
