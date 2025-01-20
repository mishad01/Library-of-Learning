// var myInfo = {
//     YourName :"Mishad",
//     village : "Cumilla",
//     phone : "01932485034",
// };

// console.log(myInfo.phone);
// var village = myInfo["village"];
// console.log(village);

function myInfo2 (a,b,c){
    this.a = a;
    this.b = b;
    this.c = c;
}

var newObj = new myInfo2(345,3452,334543);
console.log(newObj.a);