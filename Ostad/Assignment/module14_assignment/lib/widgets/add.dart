import 'package:flutter/material.dart';

class AddNameNumber extends StatefulWidget {
  AddNameNumber({
    super.key,
    required this.onAdd,
  });
  void Function(String, String) onAdd;

  @override
  State<AddNameNumber> createState() => _AddNameNumberState();
}

class _AddNameNumberState extends State<AddNameNumber> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 200,
        // width: double.infinity,
        // color: Colors.green.shade50,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameTEController,
                decoration: InputDecoration(hintText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Input Name Correctly';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _numberTEController,
                decoration: InputDecoration(hintText: 'Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Input Number Correctly';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onAdd(
                          _nameTEController.text, _numberTEController.text);
                    }
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTEController.dispose();
    _numberTEController.dispose();
  }
}
