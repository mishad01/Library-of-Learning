import 'package:flutter/material.dart';

class FootballScoreCard extends StatelessWidget {
  const FootballScoreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('0',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text('Text Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            ),
            Text('VS'),
            Column(
              children: [
                Text('0',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text('Text Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
      ),
    );
  }
}
