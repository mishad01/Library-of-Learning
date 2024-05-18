import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameTEContoller = TextEditingController();
  final TextEditingController _unitPriceTEContoller = TextEditingController();
  final TextEditingController _quantityTEContoller = TextEditingController();
  final TextEditingController _totalpriceTEContoller = TextEditingController();
  final TextEditingController _imageTEContoller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                //autovalidateMode: AutovalidateMode.always,
                controller: _nameTEContoller,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _unitPriceTEContoller,
                decoration: InputDecoration(
                  hintText: 'Unit Price',
                  labelText: 'Unit Price',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _quantityTEContoller,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product Quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _totalpriceTEContoller,
                decoration: InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Total Price',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _imageTEContoller,
                decoration: InputDecoration(
                  hintText: 'Image',
                  labelText: 'Image',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product image';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addProduct();
                    }
                  },
                  child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    const String addNewProductUrl =
        'https://crud.teamrabbil.com/api/v1/CreateProduct';

    Map<String, dynamic> inputData = {
      "Img": "xxxxxxxx",
      "ProductCode": "yhjgjk",
      "ProductName": "test",
      "Qty": "2",
      "TotalPrice": "vvvvvvvvvvv",
      "UnitPrice": "2789"
    };

    Uri uri = Uri.parse(addNewProductUrl);
    Response response = await post(uri,
        body: jsonEncode(inputData),
        headers: {'content-type': 'application/json'});
    print(response.statusCode);
    print(response.body);
    print(response.headers);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTEContoller.dispose();
    _imageTEContoller.dispose();
    _totalpriceTEContoller.dispose();
    _quantityTEContoller.dispose();
    _unitPriceTEContoller.dispose();
    super.dispose();
  }
}
