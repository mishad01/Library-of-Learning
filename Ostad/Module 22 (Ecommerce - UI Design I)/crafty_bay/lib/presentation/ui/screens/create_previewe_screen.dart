import 'package:crafty_bay/presentation/ui/widgets/cart_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CreatePreviewScreen extends StatefulWidget {
  const CreatePreviewScreen({super.key});

  @override
  State<CreatePreviewScreen> createState() => _CreatePreviewScreenState();
}

class _CreatePreviewScreenState extends State<CreatePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBarWidget('Create Review'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(hintText: 'First Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Write Review'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}
