import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
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
        title: Text('Update Product'),
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
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text('Add')),
            ],
          ),
        ),
      ),
    );
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
