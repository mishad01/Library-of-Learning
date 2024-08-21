import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_score_application/entities/football.dart';
import 'package:live_score_application/ui/widgets/football_score_card.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFootballMatches();
  }

  Future<void> _getFootballMatches() async {
    matchList.clear();
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();
    //result.docs => We will fetch all the data which is result using for in
    //doc =>It represents 1 doc from so many docs
    //In C++ this for in is basically (for auto x : xyz)
    for (QueryDocumentSnapshot doc in result.docs) {
      matchList.add(
        Football(
            matchName: doc.id,
            team1Name: doc.get('team1Name'),
            team2Name: doc.get('team2Name'),
            team1Score: doc.get('team1'),
            team2Score: doc.get('team2')),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football'),
      ),
      body: StreamBuilder(
          stream: firebaseFirestore.collection('football').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData == false) {
              return Center(child: Text('Empty List'));
            }
            matchList.clear();
            for (QueryDocumentSnapshot doc in snapshot.data?.docs ?? []) {
              matchList.add(
                Football(
                    matchName: doc.id,
                    team1Name: doc.get('team1Name'),
                    team2Name: doc.get('team2Name'),
                    team1Score: doc.get('team1'),
                    team2Score: doc.get('team2')),
              );
            }
            return ListView.builder(
              itemCount: matchList.length,
              itemBuilder: (context, index) {
                return FootballScoreCard(
                  football: matchList[index],
                );
              },
            );
          }),
    );
  }
}
