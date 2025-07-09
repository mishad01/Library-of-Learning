class Person with Logger, validation{
  String email;
  String password;

  Person(this.email,this.password);

  void displayInfo(){
    if(validatePassword(password)!=null){
      log(validatePassword(password).toString());
    }
    log("User email ${email} and password is ${password}");
  }
}


//Mixin allows to share method between differnet classes
mixin Logger{
  void log(String message){
    print(message);
  }
}

mixin validation{
  String? validatePassword(String value){
    if(value.isEmpty){
      return "Password cannot be empty";
    }
    if(value.length<6){
      return "Password cannot be less than 6";
    }
    return null;
  }
}

void main(){
  Person person = Person('test@gmail.com', '1234');
  person.displayInfo();
}