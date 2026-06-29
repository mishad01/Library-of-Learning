interface IUser{
    readonly id: number;  // cannot be changed after assignment
    name: string;
    age?: number;         // optional — caller can skip it
}

let users: IUser[] = [];

let user1: IUser = {
    id: 1,
    name: "Sakif Rahaman",
    age: 25
}

// user1.id = 99; // ❌ Error — id is readonly


// ─── Function signature in interface ─────────────────────────────────────────
interface IMath {
    add(a: number, b: number): number;
    subtract(a: number, b: number): number;
}

const math: IMath = {
    add: (a, b) => a + b,
    subtract: (a, b) => a - b,
};
console.log(math.add(5, 3));      // 8
console.log(math.subtract(5, 3)); // 2


// ─── Extending interfaces ─────────────────────────────────────────────────────
interface IAnimal {
    name: string;
}

interface IDog extends IAnimal {
    breed: string;
}

const dog: IDog = {
    name: "Rex",   // inherited from IAnimal
    breed: "Labrador"
};
console.log(dog.name);  // "Rex"
console.log(dog.breed); // "Labrador"


// ─── Extending multiple interfaces ───────────────────────────────────────────
interface IAddress {
    city: string;
    zip: number;
}

interface IContact {
    email: string;
    phone: string;
}

interface IEmployee extends IAddress, IContact {
    employeeId: number;
    name: string;
}

const emp: IEmployee = {
    employeeId: 101,
    name: "Sakif",
    city: "Dhaka",
    zip: 1200,
    email: "sakif@email.com",
    phone: "01700000000"
};
console.log(emp.name, emp.city);


// ─── interface vs type alias ──────────────────────────────────────────────────
// Both define the shape of an object — but they have key differences

type TUser = {
    id: number;
    name: string;
};

interface IUser2 {
    id: number;
    name: string;
}

// Key difference 1: interface can be extended, type uses intersection (&)
interface IAdmin extends IUser2 { role: string; }       // ✅ interface extends interface
type TAdmin = TUser & { role: string };                  // type uses & for extension

// Key difference 2: interface can be re-opened (declaration merging), type cannot
interface IUser2 { age: number; }  // ✅ merges with the IUser2 above — adds age
// type TUser = { age: number };   // ❌ Error — cannot redeclare a type alias

// Key difference 3: type can represent primitives and unions, interface cannot
type ID = string | number;         // ✅ only possible with type
// interface IID = string | number // ❌ not valid

// Rule of thumb:
// Use interface for object shapes and class contracts
// Use type for unions, primitives, and utility types

function test<T>(x: T){
    console.log(x);
}

test(10);