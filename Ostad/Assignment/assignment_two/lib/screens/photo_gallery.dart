import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 178, 17),
          title: Center(
            child: const Text(
              'Photo Gallery',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          leading: Image.asset(
            'assets/images/left-arrow.png',
            scale: 13,
          ),
        ),
        body: Text("data"));
  }
}
