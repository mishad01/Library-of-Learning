// ============================================================
// TypeScript Custom Types (Type Aliases)
// ============================================================
// The `type` keyword lets you give a name to a shape or a set
// of allowed values, then reuse it anywhere. Read top to bottom
// alongside the README.


// ------------------------------------------------------------
// 1. Object type alias
// ------------------------------------------------------------
// Describe the shape of an object: which properties it has and
// what type each property is.

type User = {
  userName: string;
  userId: number;
  email?: string; // the ? makes this property optional
};

// Use the type for a single object...
let user1: User;
user1 = { userName: "mishad", userId: 10 }; // email omitted - allowed because it is optional

// ...or for an array of that object.
let users: User[];
users = [];


// ------------------------------------------------------------
// 2. Union type alias (a fixed set of allowed values)
// ------------------------------------------------------------
// RequestType can only ever be one of these four exact strings.
// This is called a "string literal union".

type RequestType = "Get" | "Post" | "Put" | "Delete";

let requestType: RequestType;
requestType = "Get";
requestType = "Post";
// requestType = "sdf"; // ERROR - "sdf" is not one of the allowed values

function requestHandler(requestType: RequestType) {
  if (requestType === "Get") {
    console.log("Handling GET request");
  } else if (requestType === "Post") {
    console.log("Handling POST request");
  } else if (requestType === "Put") {
    console.log("Handling PUT request");
  } else if (requestType === "Delete") {
    console.log("Handling DELETE request");
  }
}

requestHandler("Post");


// ------------------------------------------------------------
// 3. Optional properties (?)
// ------------------------------------------------------------
// A property marked with ? may be present or omitted entirely.

type UserWithOptional = {
  userName: string;
  userId: number;
  email?: string; // optional - can be left out
};

let user2: UserWithOptional = { userName: "Sakif", userId: 1 };                         // OK - email omitted
let user3: UserWithOptional = { userName: "Anis", userId: 2, email: "anis@gmail.com" }; // OK


// ------------------------------------------------------------
// 4. Readonly properties
// ------------------------------------------------------------
// A readonly property can be set when the object is created,
// but never reassigned afterwards.

type UserReadonly = {
  readonly userId: number;
  userName: string;
};

let user4: UserReadonly = { userId: 1, userName: "Sakif" };
// user4.userId = 2;        // ERROR - userId is readonly
user4.userName = "Mishad"; // OK - userName is not readonly


// ------------------------------------------------------------
// 5. Intersection types (&)
// ------------------------------------------------------------
// Combine multiple types into one. The result must satisfy ALL
// of them, so it needs every property from each.

type Admin = { role: string };
type Employee = { name: string; salary: number };

type AdminEmployee = Admin & Employee; // must have role, name, AND salary

let adminEmployee: AdminEmployee = {
  role: "admin",
  name: "Sakif",
  salary: 50000,
};


// ------------------------------------------------------------
// 6. Extending a type with intersection
// ------------------------------------------------------------
// A common pattern: take an existing type and add more to it.

type Animal = { name: string };
type Dog = Animal & { breed: string }; // Dog has both name and breed

let dog: Dog = { name: "Bruno", breed: "Labrador" };
console.log(dog);
