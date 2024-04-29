import 'package:assignment_two/data/dummy_data.dart';
import 'package:assignment_two/widget/categories_grid_item.dart';
import 'package:flutter/cupertino.dart';
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // Define your action here
            },
          )
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 2, // Adjusted aspect ratio
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, // Added mainAxisSpacing
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
