# Encapsulation & Access Modifiers in TypeScript

## What is Encapsulation?

Encapsulation means **hiding internal data** and only exposing what's needed. You control what can be read or changed from outside the class.

---

## `readonly` — Cannot be changed after assignment

```ts
class User {
    readonly userName: string;
    public age: number;

    constructor(userName: string, age: number) {
        this.userName = userName;
        this.age = age;
    }
}

const user = new User("robi", 23);
console.log(user.userName); // ✅ can read
// user.userName = "other"; // ❌ Error — readonly
user.age = 24;              // ✅ can change — not readonly
```

---

## Manual Getter/Setter Methods

The traditional way — use regular methods to get/set private fields:

```ts
class Student {
    private studentId: number;

    constructor(studentId: number) {
        this.studentId = studentId;
    }

    setStudentId(studentId: number) {
        this.studentId = studentId;
    }

    getStudentId(): number {
        return this.studentId;
    }
}

student1.setStudentId(1302020017);
console.log(student1.getStudentId());
```

---

## TypeScript `get` / `set` Keywords (Cleaner Way)

TypeScript has built-in getter/setter syntax. They **look like property access** but run a function behind the scenes.

```ts
class Person {
    private _name: string;
    private _age: number;

    constructor(name: string, age: number) {
        this._name = name;
        this._age = age;
    }

    get name(): string {
        return this._name;
    }

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

console.log(person.name); // "Sakif" — runs getter
person.name = "Mishad";   // runs setter (with validation)
console.log(person.name); // "Mishad"

// person.name = "";  // ❌ throws: Name cannot be empty
// person.age = -5;   // ❌ throws: Age cannot be negative
```

---

## Manual Methods vs `get`/`set`

| | Manual methods | `get`/`set` keywords |
|---|---|---|
| Syntax | `person.getName()` | `person.name` |
| Feels like | Method call | Property access |
| Validation | ✅ Yes | ✅ Yes |
| TypeScript style | Old way | Preferred |

---

## Convention: `_privateField` naming

When using `get`/`set`, the private backing field is named with an underscore prefix (`_name`, `_age`) to avoid naming conflicts with the getter/setter.

```ts
private _name: string;  // backing field
get name(): string { return this._name; } // public getter
set name(v: string) { this._name = v; }   // public setter
```

---

## Key Takeaways

- `readonly` = can set once (in constructor), never change after
- `private` = hide data, expose via getter/setter
- `get`/`set` keywords = cleaner than manual methods, looks like property access
- Always validate in setters — that's the main benefit of encapsulation
