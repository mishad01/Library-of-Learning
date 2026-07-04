void main() {
  List listname = [10, 20, 30, 40, 50];
  listname.add(60);
  List check = []; //This is how we have to declare a list
  //check.addAll(listname);
  //print(listname);
  check.add("ABC");
  check.add("ADEF");
  check.add("AFGHI");
  check.add("AJKL");
  check.add("AMNO");

  check.insert(2, 100); //We can insert value in a specafic index
  check.insert(5, listname);
  //check.replaceRange(5, 10, [10, 20, 30, 40, 50, 60]);
  print(check);
  print("Length : ${check.length}");
  print("Length : ${listname.length}");
}
