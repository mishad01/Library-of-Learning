
interface IUserFormatter {
    formatUser : ()=> string;
}

class User implements IUserFormatter {
    formatUser() {
        return `Name: ${this.userName}, Age: ${this.age}`;
    }
    constructor(public userName: string, public age: number,) { }
}

let user = new User("sakif", 23);
console.log(user.userName);
console.log(user.age);