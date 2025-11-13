import 'package:fixbuilder/CostomWidget/const_Widget.dart';
import 'package:fixbuilder/CostomWidget/costomButton.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Livematch extends StatelessWidget {
  final String team1;
  final String team2;
  final int matchIndex;

  const Livematch({
    super.key,
    required this.team1,
    required this.team2,
    required this.matchIndex,
  });

  @override
  Widget build(BuildContext context) {
    print('Team : [$team1, $team2]'); // ✅ should print real names like [yy, kk]
    final matchProv = Provider.of<Leaguevm>(context);
    final score1 = matchProv.team1Goal[matchIndex];
    final score2 = matchProv.team2Goal[matchIndex];
    return Scaffold(
      appBar: AppBar(
        actions: [costomButton(title: 'update', width: 70, height: 30)],
        title: Text('Live Match'),
      ),

      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' $team1',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                constWidth5,
                constWidth5,

                Text(
                  '$score1',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                constWidth5,

                Text('-'),
                constWidth5,
                Text(
                  '$score2',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                constWidth5,
                constWidth5,

                Text(
                  ' $team2',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    matchProv.goalIncre1(matchIndex);
                  },
                  icon: Icon(Icons.add, color: Colors.amber),
                ),
                Text('Goal'),
                IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    matchProv.goalDecre1(matchIndex);
                  },
                  icon: Icon(Icons.remove, color: Colors.amber),
                ),

                Spacer(),
                IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    matchProv.goalIncre2(matchIndex);
                  },
                  icon: Icon(Icons.add, color: Colors.amber),
                ),
                Text('Goal'),
                IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    matchProv.goalDecre2(matchIndex);
                  },
                  icon: Icon(Icons.remove, color: Colors.amber),
                ),
              ],
            ),
            Container(
              height: 5,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: matchProv.goalscorer1[matchIndex].length,
                        itemBuilder: (context, index) {
                          final controller =
                              matchProv.goalscorer1[matchIndex][index];
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            width: 100,
                            height: 50,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'hh',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: const Color.fromARGB(255, 59, 4, 146),
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: matchProv.goalscorer2[matchIndex].length,
                          itemBuilder: (context, index) {
                            final controller =
                                matchProv.goalscorer2[matchIndex][index];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              width: 100,
                              height: 50,
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: 'hh',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
