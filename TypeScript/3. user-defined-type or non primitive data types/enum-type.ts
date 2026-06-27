// ============================================================
// TypeScript Enums
// ============================================================
// An enum (enumeration) gives friendly names to a fixed set of
// related constants. No duplicate names are allowed inside one
// enum. Read top to bottom alongside the README.


// ------------------------------------------------------------
// 1. Numeric enum (the default)
// ------------------------------------------------------------
// If you do not assign values, members auto-number from 0.

enum RequestType {
  readData,   // 0
  saveData,   // 1
  deleteData, // 2
}

console.log(RequestType.readData); // 0
console.log(RequestType[2]);       // "deleteData" (reverse mapping, see section 7)


// ------------------------------------------------------------
// 2. Custom numeric values
// ------------------------------------------------------------
// You can set any numbers you like. Useful for real-world codes.

enum StatusCode {
  Ok = 200,
  NotFound = 404,
  ServerError = 500,
}

console.log(StatusCode.Ok);       // 200
console.log(StatusCode.NotFound); // 404


// ------------------------------------------------------------
// 3. String enum
// ------------------------------------------------------------
// Each member must be given an explicit string value.
// String enums are more readable in logs and have NO reverse mapping.

enum UserRequest {
  ReadData = "READ_DATA",
  SaveData = "SAVE_DATA",
  UpdateData = "UPDATE_DATA",
}

console.log(UserRequest.ReadData);     // "READ_DATA"
console.log(UserRequest["UpdateData"]); // "UPDATE_DATA"


// ------------------------------------------------------------
// 4. Heterogeneous enum (mix of string and number)
// ------------------------------------------------------------
// Allowed, but generally discouraged - it mixes concerns.

enum User {
  id = 101,
  name = "anisul",
}


// ------------------------------------------------------------
// 5. const enum
// ------------------------------------------------------------
// A const enum is inlined at compile time. No enum object is
// generated in the JavaScript output, so it is more efficient.

const enum Direction {
  Up,
  Down,
  Left,
  Right,
}

let move = Direction.Up; // compiles to: let move = 0


// ------------------------------------------------------------
// 6. Using an enum in a function
// ------------------------------------------------------------
// The parameter type forces callers to pass an enum member,
// not a raw string.

enum Status {
  Active = "ACTIVE",
  Inactive = "INACTIVE",
}

function getStatus(status: Status): void {
  console.log(status);
}

getStatus(Status.Active); // "ACTIVE"
// getStatus("ACTIVE");   // ERROR - must use the enum member, not a raw string


// ------------------------------------------------------------
// 7. Reverse mapping (numeric enums only)
// ------------------------------------------------------------
// A numeric enum stores BOTH name->value AND value->name, so you
// can look up in either direction. String enums do NOT do this.

enum Days {
  Monday = 1,
  Tuesday,   // 2
  Wednesday, // 3
}

console.log(Days["Monday"]); // 1        - forward lookup (name -> value)
console.log(Days[1]);        // "Monday" - reverse lookup (value -> name)


// ------------------------------------------------------------
// 8. Enum vs literal union type
// ------------------------------------------------------------
// Both restrict a value to a fixed set. A literal union is
// simpler and generates no JavaScript code.

enum HttpMethod {
  Get = "GET",
  Post = "POST",
  Delete = "DELETE",
}

type HttpMethodType = "GET" | "POST" | "DELETE"; // preferred in modern TypeScript

// Use an enum when: you need reverse mapping or a real object at runtime.
// Use a literal union when: you just need type safety with no extra overhead.
