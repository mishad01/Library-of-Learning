interface IUser{
    id: number; 
    name: string; 
    age: number
}
let users : IUser [] = []

let user1 : IUser = {
    id: 1,
    name: "Sakif Rahaman",
    age: 25
}

function test <T>(x : T){
    console.log(x);
}

test(10);