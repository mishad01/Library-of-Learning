import 'package:flutter/material.dart';
import 'package:module12assignment/product.dart';

class DetailScreen extends StatelessWidget {
  Product product;

  DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Title : ${product.title}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black.withOpacity(.8),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ID : ${product.id}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black.withOpacity(.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
