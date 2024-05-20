import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module12assignment/product.dart';
import 'package:module12assignment/product_details_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _getProductListInProgress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return _buildListTile(productList[index]);
        },
      ),
    );
  }

  Widget _buildListTile(Product product) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0), // Adjust as needed
      //padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust as needed
      child: ListTile(
        // Adjust as needed
        leading: Image.network(product.thumbnailUrl),

        title: Text(
          product.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black.withOpacity(.8),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(product: product),
              ));
        },
      ),
    );
  }

  Future<void> _getImageList() async {
    _getProductListInProgress = true;
    setState(() {});
    const String addImageUrl = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(addImageUrl);
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);
    final decodeData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> item in decodeData) {
        Product product = Product(
            id: item['id'],
            albumId: item['albumId'],
            url: item['url'],
            thumbnailUrl: item['thumbnailUrl'],
            title: item['title']);
        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Add Image Failed'),
        ),
      );
    }
    _getProductListInProgress = false;
    setState(() {});
  }
}
