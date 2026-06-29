# Classes in TypeScript

## Long Way vs Shorthand Constructor

**Long way — declare property, then assign in constructor:**
```ts
class User {
    userName: string;
    age: number;

    constructor(userName: string, age: number) {
        this.userName = userName;
        this.age = age;
    }
}
```

**Shorthand — TypeScript does both in one step:**
```ts
class User {
    constructor(public userName: string, public age: number) {}
}
```
Both produce identical results. Shorthand is preferred.

---

## Access Modifiers

| Modifier | Accessible from |
|---|---|
| `public` | Anywhere |
| `private` | Only inside this class |
| `protected` | Inside this class + subclasses |

```ts
class UserWithAccess {
    constructor(
        public userName: string,    // accessible from anywhere
        private password: string,   // only inside this class
        protected age: number       // this class + subclasses
    ) {}
}

const u = new UserWithAccess('Sakif', 'abc123', 10);
console.log(u.userName);   // ✅
// console.log(u.password); // ❌ Error: private
// console.log(u.age);      // ❌ Error: protected
```

---

## `super()` — Calling the Parent Constructor

When a subclass has its own constructor, it must call `super()` first to initialize the parent:

```ts
class Student extends User {
    constructor(
        userName: string,        // no public — passed up to parent
        age: number,
        public studentId: string // Student's own new property
    ) {
        super(userName, age);    // must be called first
    }
}

const s = new Student('Sakif', 10, 'STU001');
console.log(s.userName);  // ✅ inherited from User
console.log(s.studentId); // ✅ Student's own
```

---

## `static` Members

Static members belong to the **class itself**, not to any instance. No need to `new` the class.

```ts
class MathHelper {
    static PI = 3.14;

    static square(n: number): number {
        return n * n;
    }
}

console.log(MathHelper.PI);        // 3.14
console.log(MathHelper.square(5)); // 25
```

**Real use case — counting instances:**
```ts
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
```

---

## Key Takeaways

- Use shorthand constructor (`public` in params) to reduce boilerplate
- `private` = only this class, `protected` = this class + children, `public` = everywhere
- Always call `super()` first in a subclass constructor
- `static` = belongs to the class, not instances — no need to instantiate
