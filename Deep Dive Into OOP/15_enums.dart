enum Gender {Male, Female, Others}
enum Status {loading,error,succes}

class Person{
  String name;
  Gender gender;
  Person(this.name,this.gender);
}

void main(){
  Person person = Person("Mishad", Gender.Female);
  //Gender gender = Gender.Male;

  switch(person.gender){
    case Gender.Male:
    print("Male");
    case Gender.Female:
    print("Female");
    case Gender.Others:
    print("Others");
 
  }
}