import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module13assignent/product_list_screen.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key, required this.product});
  Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEContoller = TextEditingController();
  final TextEditingController _totalpriceTEContoller = TextEditingController();
  final TextEditingController _imageTEContoller = TextEditingController();
  final TextEditingController _productCodeTEContoller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool updateProductProgress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEController.text = widget.product.productName;
    _unitPriceTEController.text = widget.product.unitPrice.toString();
    _quantityTEContoller.text = widget.product.quantity.toString();
    _totalpriceTEContoller.text = widget.product.totalPrice.toString();
    _imageTEContoller.text = widget.product.image.toString();
    _productCodeTEContoller.text = widget.product.productCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: buildColumn(),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        TextFormField(
            controller: _nameTEController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Name',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Write your Product';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: _unitPriceTEController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Unit Price',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Write your Product';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: _productCodeTEContoller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Write your Product code';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: _quantityTEContoller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Quantity',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Write Quantity';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: _totalpriceTEContoller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Write your total price';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: _imageTEContoller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Image',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Give image';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _updateProduct();
              }
            },
            child: Text('UPDATE'))
      ],
    );
  }

  Future<void> _updateProduct() async {
    updateProductProgress = true;
    setState(() {});
    Map<String, dynamic> inputData = {
      "Img": _imageTEContoller.text.trim(),
      "ProductCode": _productCodeTEContoller.text,
      "ProductName": _nameTEController.text,
      "Qty": _quantityTEContoller.text,
      "TotalPrice": _totalpriceTEContoller.text,
      "UnitPrice": _unitPriceTEController.text
    };
    String _updateProductUrl =
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}';
    Uri uri = Uri.parse(_updateProductUrl);

    Response response = await post(
      uri,
      body: jsonEncode(inputData),
      headers: {'content-type': 'application/json'},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Updated')));
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Update Failed')));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _productCodeTEContoller.dispose();
    _quantityTEContoller.dispose();
    _totalpriceTEContoller.dispose();
    _imageTEContoller.dispose();
    super.dispose();
  }
}
