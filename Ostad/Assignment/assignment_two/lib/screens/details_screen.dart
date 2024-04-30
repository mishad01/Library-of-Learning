import 'package:assignment_two/model/gallary.dart';
import 'package:assignment_two/widget/suggestionGrid.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.gallery,
  });
  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 178, 17),
        title: const Center(
          child: Text(
            'Photo Gallery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // leading: Image.asset(
        //   'assets/images/left-arrow.png',
        //   scale: 13,
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // Define your action here
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 280,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/mood_1.jpeg'),
                      fit: BoxFit.cover,
                      alignment: FractionalOffset(0.7, 0.512),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mood With Nature',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Being In Nature, Or Even Viewing Scenes Of Nature, Reduces Anger, Fear, And Stress And Increases Pleasant Feelings',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 51,
                width: 392,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 56, 207, 61),
                ),
                child: const Center(
                  child: Text(
                    'See More',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Suggestion',
                  style: TextStyle(
                      color: Color.fromARGB(255, 71, 156, 74), fontSize: 17),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SuggestionGrid(
                    text: 'road_7.jpeg',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SuggestionGrid(
                    text: 'asthetic_2.jpeg',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
