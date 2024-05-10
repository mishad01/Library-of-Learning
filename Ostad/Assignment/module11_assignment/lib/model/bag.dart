import 'package:flutter/material.dart';

class Bag {
  const Bag({
    required this.image,
    required this.type,
    required this.color,
    required this.size,
    required this.total,
    required this.price,
  });
  final String image;
  final String type;
  final String color;
  final String size;
  final int total;
  final int price;
}
