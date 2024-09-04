import 'package:crafty_bay/presentation/ui/screens/widgets/cart_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBarWidget('Reviews'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                  ),
                ),
                title: Text(
                  'Rabbil Hasan',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Text(
                  'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
