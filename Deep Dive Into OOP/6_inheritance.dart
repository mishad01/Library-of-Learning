//Parent 
class Person{
  String? name;
  int? age;
  void display(){
    print("Name : $name");
    print("age $age");
  }
}


//Child Class,
class Student extends Person{
  //Fields
  int? regNumber;
  String? sem;

  //Method
  void displaySchoolInfo(){
    print("Name: $name");
    print("Age: $age");
    print("Registration number: $regNumber");
    print("Semester: $sem");
  }
}
void main(){
  Student s1 = Student();
  s1.name = "Mishad";
  s1.age = 23;
  s1.regNumber = 22100;
  s1.sem = "11th";
  s1.displaySchoolInfo();
}