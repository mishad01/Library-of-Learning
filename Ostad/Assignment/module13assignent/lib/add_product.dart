import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEContoller = TextEditingController();
  final TextEditingController _totalpriceTEContoller = TextEditingController();
  final TextEditingController _imageTEContoller = TextEditingController();
  final TextEditingController _productCodeTEContoller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
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
        Visibility(
          visible: _addNewProductInProgress == false,
          replacement: CircularProgressIndicator(),
          child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addProduct();
                }
              },
              child: Text('ADD')),
        )
      ],
    );
  }

  Future<void> _addProduct() async {
    _addNewProductInProgress = true;
    setState(() {});

    Map<String, dynamic> inputData = {
      "Img": _imageTEContoller.text.trim(),
      "ProductCode": _productCodeTEContoller.text,
      "ProductName": _nameTEController.text,
      "Qty": _quantityTEContoller.text,
      "TotalPrice": _totalpriceTEContoller.text,
      "UnitPrice": _unitPriceTEController.text
    };

    const String addNewProduct =
        'https://crud.teamrabbil.com/api/v1/CreateProduct';
    Uri uri = Uri.parse(addNewProduct);

    Response response = await post(
      uri,
      body: jsonEncode(inputData),
      headers: {'content-type': 'application/json'},
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      _nameTEController.clear();
      _imageTEContoller.clear();
      _totalpriceTEContoller.clear();
      _quantityTEContoller.clear();
      _unitPriceTEController.clear();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Added')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Add Product Fail')));
    }
    _addNewProductInProgress = false;
    setState(() {});
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
