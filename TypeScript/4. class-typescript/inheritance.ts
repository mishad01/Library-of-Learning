class User {
    constructor(public userName: String, public age: number) {
    }

    display():void{
        console.log(this.userName,this.age);
    }
}

class Student extends User {
  studentId: number;

  constructor(userName: string, age: number, studentId: number) {
    super(userName, age);
    this.studentId = studentId;
  }
  display(): void {
    console.log(
      `username: ${this.userName}, age: ${this.age}, id: ${this.studentId}`
    );
  }
}

let student1 = new Student("Sakif", 10, 123);
student1.display();

let user1 = new User("Mishad", 10);
user1.display();