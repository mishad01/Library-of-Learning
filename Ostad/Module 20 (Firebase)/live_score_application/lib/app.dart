import 'package:flutter/material.dart';
import 'package:live_score_application/ui/screens/match_list_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatchListScreen(),
    );
  }
}
