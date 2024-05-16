import 'package:flutter/material.dart';
import 'package:rest_api_read_write/add_product_screen.dart';
import 'package:rest_api_read_write/update_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  void _showDeleteConfirmationDialouge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are you sure that you wanna delete this product?'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Cancle')),
            TextButton(onPressed: () {}, child: Text('Yes, delete')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildProductItem();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductItem() {
    return ListTile(
      leading: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/7/7a/Shoes_sport-right.png'),
      title: Text('Product name'),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit Price 100'),
          Text('Quantity  100'),
          Text('Total Price 100'),
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
            onPressed: _showDeleteConfirmationDialouge,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
