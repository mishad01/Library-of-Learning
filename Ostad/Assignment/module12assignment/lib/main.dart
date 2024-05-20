import 'package:flutter/material.dart';
import 'package:module12assignment/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff2196F3),
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
      )),
    );
  }
}
