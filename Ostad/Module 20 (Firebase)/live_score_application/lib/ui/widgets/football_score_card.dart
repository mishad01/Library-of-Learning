import 'package:flutter/material.dart';
import 'package:live_score_application/entities/football.dart';

class FootballScoreCard extends StatelessWidget {
  const FootballScoreCard({
    super.key,
    required this.football,
  });
  final Football football;

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
                Text(football.team1Score.toString(),
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text(football.team1Name.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            ),
            Text('VS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            Column(
              children: [
                Text(football.team2Score.toString(),
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text(football.team2Name.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
      ),
    );
  }
}
