"use strict";
// 1. union ( | ): 
// Union Type - more than one type for variable or function parameter.
// Program - odd/even for number and string to give idea about this union concept.
let userId = 'Mishad';
function userIdDataType(userId) {
    console.log(typeof userId);
}
userIdDataType('123');
userIdDataType(123);
//Arrow fucntion
const isEven = (num) => {
    if (typeof (num) === 'number') {
        if (num % 2 === 0) {
            return 'Even';
        }
        else {
            return 'Odd';
        }
    }
    else {
        num = Number(num);
        if (num % 2 === 0) {
            return 'Even';
        }
        else {
            return 'Odd';
        }
    }
};
console.log(isEven(5));
console.log(isEven(10));
console.log(isEven("8"));
console.log(isEven("12"));
