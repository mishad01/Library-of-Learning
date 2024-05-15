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
  int _totalValue = 0;

  void _updateTotalValue(int value) {
    setState(() {
      _totalValue += value;
    });
  }

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
                onQuantityChanged: (value) =>
                    _updateTotalValue(value), // Pass callback
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
                onQuantityChanged: (value) =>
                    _updateTotalValue(value), // Pass callback
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
                onQuantityChanged: (value) =>
                    _updateTotalValue(value), // Pass callback
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
                  Text('\$$_totalValue'), // Display total value
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text("Congratulations!")),
                  content: Text("You have added \$$_totalValue on your bag"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: Center(
                              child: Text(
                            'Okay',
                            style: TextStyle(color: Colors.white),
                          )),
                        )),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Text("No"),
                    // ),
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
