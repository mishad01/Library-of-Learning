/*
   void main(){
  Person randomPerson = Person('Sakif Rahman', 'Mishad', 'Male', 22);
  print(randomPerson.getFullName());
  randomPerson.changeGender('Male');
  print(randomPerson.getGender());
  randomPerson.setAge=20;
}*/

/*Encapsulation in is like putting  code in a box and giving it a lock.
 The box protects the code inside from being directly accessed or modified by anything outside the box.*/

class Person{
  String _firstname; // When we use "  _  " in front of variable it becomes private.
  String _lastname;
  String _gender;
  int _age;

  Person(this._firstname,this._lastname,this._gender,this._age){
    print(_getBirthyear());
  }

  // We use "set" to understand that We've used a setter
  //Setter e basically where we assign value
  // And also using set we can assign value like an variable . Example = randomPerson.setAge=20;
  void set setAge(int newAge){
    if(newAge >=12 && newAge <= 100){
      _age = newAge;
    }
  }

  // We use "get" to understand that We've used a getter
  //Getter is where we gain or get or achieve value from a source
  int get getAge{
    return _age;
  }

  //We can assign value in private data using method
  void changeGender(String gender){
    if(gender=='Male' || gender =='Female'){
      _gender = gender;
    }
  }

  //Getter Method
  String getFullName(){
    return _firstname + ' ' + _lastname; // String concat = If  we add to string or we can say if we sum two string
  }

  String getGender(){
    return _gender;
  }

  int _getBirthyear(){
    return 2024-_age;
  }

}