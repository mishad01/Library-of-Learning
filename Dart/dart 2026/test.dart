import 'dart:convert';
import 'dart:io';

void main() {
  final file = File(
    '/Users/sakif/Documents/presonal/github/Library-of-Learning/Dart/dart 2026/pair.json',
  );

  final jsonString = file.readAsStringSync();
  final data = jsonDecode(jsonString) as Map;

  // Whole decoded structure
  print(data);

  // // Just the inventory list
  // final inventory = data['inventory'] as List;
  // for (final item in inventory) {
  //   print('${item['id']}: ${item['name']} - qty ${item['quantity']}, \$${item['price']}');
  // }

  final inventory = data['inventory'] as List;
  for (final item in inventory) {
    print(
      '${item['id']}: ${item['name']} - qty ${item['quantity']}, \$${item['price']}',
    );
  }
}
