function identity <T> (value : T) : T{
    return value;
}

const a = identity<string>("Hello");
const b = identity<number> (42);

const x = identity("HI")
const y = identity(10);

function pair<T,U> (first: T, second : U): [T,U]{
    return [first,second];
}

const result = pair("age",25);

console.log(result[0])