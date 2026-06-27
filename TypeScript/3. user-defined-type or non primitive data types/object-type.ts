// ============================================================
// TypeScript Object Types
// ============================================================
// Different ways to describe the shape of an object, and the
// difference between a real shape and the generic `object` type.
// Read top to bottom alongside the README.


// ------------------------------------------------------------
// 1. Type inference (let TypeScript figure out the shape)
// ------------------------------------------------------------
// When you assign an object directly, TypeScript infers its shape.
// Here user1 is inferred as: { userName: string; userId: number }

let user1 = {
  userName: "sakif",
  userId: 10,
};

user1 = { userName: "mishad", userId: 10 }; // OK - same shape
// user1 = { userName: "mishad" };          // ERROR - userId is missing


// ------------------------------------------------------------
// 2. Inline object type annotation (with optional property)
// ------------------------------------------------------------
// Describe the shape directly in the annotation. The ? makes
// userId optional.

let user2: {
  userName: string;
  userId?: number;
};

user2 = { userName: "mishad" };            // OK - userId omitted
user2 = { userName: "sakif", userId: 10 }; // OK


// ------------------------------------------------------------
// 3. Readonly property on an inline type
// ------------------------------------------------------------
// A readonly property can be set on creation but never reassigned.

let user6: { readonly userId: number; userName: string } = {
  userId: 1,
  userName: "Sakif",
};

// user6.userId = 2;       // ERROR - userId is readonly
user6.userName = "Mishad"; // OK - userName is not readonly


// ------------------------------------------------------------
// 4. Nested objects
// ------------------------------------------------------------
// An object property can itself be an object with its own shape.

let user7: {
  userName: string;
  address: {
    city: string;
    zip: number;
  };
} = {
  userName: "Sakif",
  address: { city: "Dhaka", zip: 1200 },
};

console.log(user7.address.city); // "Dhaka"


// ------------------------------------------------------------
// 5. The generic `object` type (avoid for known shapes)
// ------------------------------------------------------------
// `object` only means "some non-primitive value". It carries NO
// information about which properties exist, so you cannot access
// them safely.

let user3: object;
user3 = { userName: "mishad", userId: 10 };

// user3.userName; // ERROR - the type `object` has no known shape
// Fix: use type inference, an inline type, or a type alias instead.


// ------------------------------------------------------------
// 6. Array of objects
// ------------------------------------------------------------

let user4: object[];
let user5: object[];

user4 = [{ userName: "mishad", userId: 10 }];
user5 = [{ userName: "anis", userId: 20 }];

user4.push(...user5); // combine the two arrays
console.log(user4);
