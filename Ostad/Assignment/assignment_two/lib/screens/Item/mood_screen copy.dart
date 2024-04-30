import 'package:assignment_two/widget/suggestionGrid.dart';
import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  MoodScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 178, 17),
        title: Center(
          child: Text(
            'Mood',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: width < 600
            ? Column(
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
                        image: DecorationImage(
                          image: AssetImage('assets/images/mood_1.jpeg'),
                          fit: BoxFit.cover,
                          alignment: FractionalOffset(0.7, 0.512),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 51,
                    width: 392,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 56, 207, 61),
                    ),
                    child: Center(
                      child: Text(
                        'See More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Suggestion',
                      style: TextStyle(
                        color: Color.fromARGB(255, 71, 156, 74),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SuggestionGrid(
                        text: 'road_7.jpeg',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SuggestionGrid(
                        text: 'asthetic_2.jpeg',
                      ),
                    ],
                  )
                ],
              )
            : SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/images/mood_1.jpeg'),
                          fit: BoxFit.cover,
                          alignment: FractionalOffset(0.7, 0.512),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
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
                            SizedBox(height: 8),
                            Text(
                              'Being In Nature, Or Even Viewing Scenes Of Nature, Reduces Anger, Fear, And Stress And Increases Pleasant Feelings',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 51,
                              width: 392,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 56, 207, 61),
                              ),
                              child: Center(
                                child: Text(
                                  'See More',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Suggestion',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 71, 156, 74),
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SuggestionGrid(
                                  text: 'road_7.jpeg',
                                ),
                                SizedBox(
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
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
