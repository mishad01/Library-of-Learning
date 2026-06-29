class User {
    readonly userName: string;
    public age: number;

    constructor(userName: string, age: number) {
        this.userName = userName;
        this.age = age;
    }

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}`);
    }
}

class Student extends User {
    private studentId: number;

    constructor(userName: string, age: number, studentId: number) {
        super(userName, age);
        this.studentId = studentId;
    }

    display(): void {
        console.log(
            `username: ${this.userName}, age: ${this.age}, id: ${this.studentId}`
        );
    }

    setStudentId(studentId: number) {
        this.studentId = studentId;
    }

    getStudentId(): number {
        return this.studentId;
    }
}


let student1 = new Student("keya", 31, 1302020015);
student1.setStudentId(1302020017);
console.log(student1.getStudentId());
// student1.display();

let user1 = new User("robi", 23);
console.log(user1.userName);


// ─── TypeScript-style getter and setter (get/set keywords) ──────────────────
// Instead of getStudentId() / setStudentId() methods above,
// TypeScript has a cleaner built-in syntax using get and set

class Person {
    private _name: string;
    private _age: number;

    constructor(name: string, age: number) {
        this._name = name;
        this._age = age;
    }

    // getter — accessed like a property, not a method
    get name(): string {
        return this._name;
    }

    // setter — validates before assigning
    set name(value: string) {
        if (value.length === 0) {
            throw new Error("Name cannot be empty");
        }
        this._name = value;
    }

    get age(): number {
        return this._age;
    }

    set age(value: number) {
        if (value < 0) {
            throw new Error("Age cannot be negative");
        }
        this._age = value;
    }
}

const person = new Person("Sakif", 25);

console.log(person.name);  // "Sakif" — looks like property access, runs getter
person.name = "Mishad";    // looks like assignment, runs setter
console.log(person.name);  // "Mishad"

// person.name = "";        // ❌ throws Error: Name cannot be empty
// person.age = -5;         // ❌ throws Error: Age cannot be negative
