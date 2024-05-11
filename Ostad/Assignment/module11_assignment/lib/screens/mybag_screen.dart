import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module11_assignment/data/dummy_data.dart';
import 'package:module11_assignment/model/bag.dart';
import 'package:module11_assignment/widgets/add_sub.dart';
import 'package:module11_assignment/widgets/bagcard.dart';

class MyBag extends StatefulWidget {
  MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  final current = availableCategories[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 244, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 244, 244),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Bag',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BagCard(
                image: "1.png",
                type: "Pullover",
                color: "Black",
                size: "L",
                total: 1,
                price: 51,
              ),
              const SizedBox(
                height: 10,
              ),
              BagCard(
                image: "2.png",
                type: 'T-Shirt',
                color: "Gray",
                size: "L",
                total: 1,
                price: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              BagCard(
                image: "3.png",
                type: 'Dress',
                color: 'Black',
                size: 'L',
                total: 1,
                price: 43,
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                children: [
                  Text('Total amount: '),
                  SizedBox(
                    width: 250,
                  ),
                  Text(' \$'),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            // Show dialog when checkout button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text("Congratulations!")),
                  content: Text("You have added items on your bag"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Add your checkout logic here
                        // For example, you can navigate to a new screen for checkout
                        Navigator.of(context).pop();
                      },
                      child:
                          ElevatedButton(onPressed: () {}, child: Text('Okay')),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No"),
                    ),
                  ],
                );
              },
            );
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(200, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Text(
            "CHECK OUT",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
