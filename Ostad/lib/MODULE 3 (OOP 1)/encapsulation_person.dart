class Person{
  String _firstname; // When we use "  _  " in front of variable it becomes private.
  String _lastname;
  String _gender;
  int age;

  Person(this._firstname,this._lastname,this._gender,this.age);

  //Getter Method
  String getFullName(){
    return _firstname + ' ' + _lastname; // String concat = If  we add to string or we can say if we sum two string
  }

  void changeGender(String gender){
    if(gender=='Male' || gender =='Female'){
      _gender = gender;
    }
  }

  String getGender(){
    return _gender;
  }
}