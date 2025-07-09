void main() {
  // Nullable and Non-nullable Types
  int fixedAge = 25;
  print(fixedAge);

  int? age;
  print(age); // null
  age = 20;
  print(age); // 20

  // Null Assertion Operator (!)
  String? name = "Sakif";
  print(name!); // Safe

  name = null;
  // print(name!); // This would crash

  // Null Coalescing Operator (??)
  String? city;
  print(city ?? "Unknown");

  city = "Dhaka";
  print(city ?? "Unknown");

  // Null-Aware Assignment (??=)
  String? country;
  country ??= "Bangladesh";
  print(country);

  country ??= "Canada"; // No change
  print(country);

  // Null-Aware Access Operator (?.)
  String? user = null;
  print(user?.length); // null

  user = "Mishad";
  print(user?.length); // 6

  // Null Checks with try-catch
  String? riskyName;

  try {
    print(riskyName!.toUpperCase()); // This will throw
  } catch (e) {
    print("Error: $e");
  }
}
