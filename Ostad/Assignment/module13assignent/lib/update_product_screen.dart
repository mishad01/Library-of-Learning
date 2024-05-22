import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

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
              if (_formKey.currentState!.validate()) {}
            },
            child: Text('UPDATE'))
      ],
    );
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
