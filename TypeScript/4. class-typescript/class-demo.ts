// ─── Long way (without public shorthand) ───────────────────────────────────
class UserLongWay {
    userName: string;   // Step 1: declare property
    age: number;        // Step 1: declare property

    constructor(userName: string, age: number) {
        this.userName = userName;  // Step 2: assign manually
        this.age = age;            // Step 2: assign manually
    }

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}`);
    }
}

// ─── Short way (with public shorthand) ─────────────────────────────────────
// TypeScript automatically declares the property AND assigns it — identical result
class User {
    constructor(public userName: string, public age: number) {}

    display(): void {
        console.log(`username: ${this.userName}, age: ${this.age}`);
    }
}

// ─── public vs private vs protected ────────────────────────────────────────
class UserWithAccess {
    constructor(
        public userName: string,    // accessible from anywhere
        private password: string,   // only accessible inside this class
        protected age: number       // accessible inside this class + subclasses
    ) {}
}

const u = new UserWithAccess('Sakif', 'abc123', 10);
console.log(u.userName);   // ✅ works
// console.log(u.password);   // ❌ Error: 'password' is private
// console.log(u.age);        // ❌ Error: 'age' is protected

// ─── Subclass using super() ─────────────────────────────────────────────────
class Student extends User {
    constructor(
        userName: string,           // no public here — passed up to parent
        age: number,
        public studentId: string    // new property only Student has
    ) {
        super(userName, age);       // calls User's constructor
    }
}

const s = new Student('Sakif', 10, 'STU001');
console.log(s.userName);    // ✅ 'Sakif'  (inherited from User)
console.log(s.studentId);   // ✅ 'STU001' (Student's own property)

// ─── static members — belong to the class itself, not instances ─────────────
class MathHelper {
    static PI = 3.14;

    static square(n: number): number {
        return n * n;
    }
}

console.log(MathHelper.PI);         // 3.14 — no need to instantiate
console.log(MathHelper.square(5));  // 25

// static counter — tracks how many instances were created
class Counter {
    static count = 0;

    constructor() {
        Counter.count++;
    }
}

new Counter();
new Counter();
new Counter();
console.log(Counter.count); // 3


// ─── Original usage ─────────────────────────────────────────────────────────
const longWayUser = new UserLongWay('Sakif', 10);
longWayUser.display();

let user1 = new User('Sakif', 10);
let user2 = new User('Mishad', 10);

console.log(user1.userName);


