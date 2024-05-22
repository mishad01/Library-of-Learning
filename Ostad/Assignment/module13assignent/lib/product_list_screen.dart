import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module13assignent/add_product.dart';
import 'package:module13assignent/update_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListInProgress = false;
  List<Product> productList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Visibility(
        visible: _getProductListInProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return _buildProductItem(productList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return ListTile(
      leading: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/7/7a/Shoes_sport-right.png'),
      title: Text(product.productName),
      subtitle: Wrap(
        spacing: 10,
        children: [
          Text('Unit Price : ${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price : ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProductScreen(),
                  ));
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    productList.clear();
    setState(() {});
    const String productListUrl =
        'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(productListUrl);
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      //Data Decode
      //get the list
      //loop over the list
      final decodeData = jsonDecode(response.body);
      final jsonproductList = decodeData['data'];
      for (Map<String, dynamic> p in jsonproductList) {
        Product product = Product(
            id: p['_id'] ?? '',
            productName: p['ProductName'] ?? '',
            productCode: p['ProductName'] ?? '',
            image: p['Img'] ?? '',
            unitPrice: p['UnitPrice'] ?? '',
            quantity: p['Qty'] ?? '',
            totalPrice: p['TotalPrice'] ?? '');
        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Get Product Failed')));
    }
    _getProductListInProgress = false;
    setState(() {});
  }
}

class Product {
  final String id;
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.image,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
  });
}
