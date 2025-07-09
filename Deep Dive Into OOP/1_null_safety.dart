void main() {
  print('--- Nullable and Non-nullable Types ---');
  
  // Non-nullable integer (must be initialized)
  int fixedAge = 25;
  print("Non-nullable age: $fixedAge");

  // Nullable integer (can be null)
  int? age;
  print("Initial nullable age: $age"); // Output: null

  age = 20;
  print("Updated nullable age: $age"); // Output: 20

  print('\n--- Null Assertion Operator (!) ---');

  String? name = "Sakif";
  print("Name with !: ${name!}"); // Safe here

  name = null;
  // Uncommenting the line below will throw an error
  // print(name!); //
  print('\n--- Null Coalescing Operator (??) ---');

  String? city;
  print("City or default: ${city ?? "Unknown"}"); // Output: Unknown

  city = "Dhaka";
  print("City after assigning: ${city ?? "Unknown"}"); // Output: Dhaka

  print('\n--- Null-Aware Assignment Operator (??=) ---');

  String? country;
  country ??= "Bangladesh"; // Assign only if null
  print("Country after ??= : $country");

  country ??= "Canada"; // This won’t overwrite because it’s not null now
  print("Country after second ??= : $country");

  print('\n--- Null-Aware Access Operator (?.) ---');

  String? user = null;
  print("User length: ${user?.length}"); // Output: null, no crash

  user = "Mishad";
  print("User length: ${user?.length}"); // Output: 6

  print('\n--- Combining Null Checks with try-catch ---');

  String? riskyName;

  try {
    // Forcefully accessing nullable value with ! (throws error if null)
    print("Uppercase: ${riskyName!.toUpperCase()}");
  } catch (e) {
    print("Caught error: $e");
  }
}
