const user = {
    name : "Sakif",
    age : 10
}

// const name = user.name;
// const age = user.age;

//const {name1, age2} = user;// It wont work as, the variable names are not same as object variable name
const {name, age} = user;//

const user2 = {
    name2 : 'Sakif',
    age2 : 10,
    city2: "Dhaka"
}

const {name2,age2} = user2
//You can pick only the keys you need. The rest are ignored.


const colors = ["red", "green", "blue"]
const [a,b,c]= colors;

console.log(a)
console.log(b)
console.log(c)

const [, , third] = colors;

 
const {detail, role = 'user'} = {detail : "Student"}

console.log

const [x = 10, y = 20] = [5,10,20];
console.log(x); // 5
console.log(y); // 20

const user3 = { name: "Sakif", age: 25 };
const {name: fullName, age : years} = user;

console.log(fullName)
console.log(years)

const test = {
    name1 : "Sakif",
    address: {
        city: "Dhaka",
        country: "Bangladesh"
    }
}

const {name1, address:{city,country}} = test;


type Props = {title : string;onPress : ()=> void};
