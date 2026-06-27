let user1 : { 
    id: number; 
    name: string; 
    age: number
} = {
    id: 1,
    name: "Sakif Rahaman",
    age: 25,
}

let user2 : { 
    id: number; 
    name: string; 
    age: number
} = {
    id: 1,
    name: "Sakif Rahaman",
    age: 25,
}

let user3 : { 
    id: number; 
    name: string; 
    age: number
} = {
    id: 1,
    name: "Sakif Rahaman",
    age: 25,
}

let user : { 
    id: number; 
    name: string; 
    age: number
} []= [];

user.push(user1);
user.push(user2);
user.push(user3);

console.log(user1);
console.log(user);

const printUserInfo = (user: { id: number; name: string; age: number }) => {
    console.log(`ID: ${user.id}, Name: ${user.name}, Age: ${user.age}`);
};

user.forEach(user=> printUserInfo(user));