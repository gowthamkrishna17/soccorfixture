import 'package:fixbuilder/CostomWidget/constWidget.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfig_vm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeagueconfigscreenView extends StatelessWidget {
  const LeagueconfigscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final fixConfig = Provider.of<FixconfigVm>(context);
    final leagueProvider = Provider.of<Leaguevm>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: leagueProvider.LeagueFixture.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final match = leagueProvider.LeagueFixture[index];
                return Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 5, 138, 116),
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${match[0]}'),
                      Text('1'),
                      CircleAvatar(radius: 38, child: Text('FH')),
                      Text('2'),

                      Text('${match[1]}'),
                    ],
                  ),
                );
              },
            ),
          ),
          // Container(
          //   height: 50,
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: const Color.fromARGB(255, 5, 138, 116),
          //     border: Border.all(width: 1),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text('Real madrid'),
          //       Text('1'),
          //       CircleAvatar(radius: 38, child: Text('FH')),
          //       Text('2'),

          //       Text('Barcelona'),
          //     ],
          //   ),
          // ),
          constHeight10,

          // Container(
          //   height: 70,
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.all(10),
          //   decoration: BoxDecoration(border: Border.all(width: 1)),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text('Real madrid'),
          //       Text('1'),
          //       Text('15-03-2025\nmonday', textAlign: TextAlign.center),
          //       Text('2'),

          //       Text('Barcelona'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
