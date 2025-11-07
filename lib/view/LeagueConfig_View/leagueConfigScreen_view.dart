import 'package:fixbuilder/CostomWidget/const_Widget.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/calenderVM.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfigVm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueTable_vm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeagueconfigscreenView extends StatelessWidget {
  const LeagueconfigscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final fixConfig = Provider.of<FixconfigVm>(context);
    final leagueProvider = Provider.of<Leaguevm>(context);
    final tablevm = context.watch<VmLeagueTable>();
    final datevm = context.watch<Calendervm>();

    // final names = context.read<FixconfigVm>().feild.map((c) => c.text).toList();
    // context.read<LeaguetableVm>().setTeams(names);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                    // padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 157, 160, 159),
                      border: Border.all(width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${datevm.pickedDate!.day}-${datevm.pickedDate!.month}-${datevm.pickedDate!.year}-${datevm.pickedDate!.weekday}',
                          ),
                        ),
                        kverticalDivider,
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text('${match[0]}'),
                              Container(
                                height: 1,
                                width: double.maxFinite,
                                color: const Color.fromARGB(255, 15, 15, 15),
                              ),
                              Text('${match[1]}'),
                            ],
                          ),
                        ),
                        kverticalDivider,

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Text('--'),
                              Container(
                                height: 1,
                                width: double.maxFinite,
                                color: const Color.fromARGB(255, 17, 17, 17),
                              ),
                              Text('--'),
                            ],
                          ),
                        ),
                        // Text('1'),
                        // CircleAvatar(radius: 38, child: Text('FH')),
                        // Text('2'),
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 2, child: const Text('Team')),

                          Expanded(flex: 1, child: const Text('P')),
                          Expanded(flex: 1, child: const Text("W")),
                          Expanded(flex: 1, child: const Text('L')),
                          Expanded(flex: 1, child: const Text('PTS')),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: tablevm.teams.length,
                        itemBuilder: (context, index) {
                          final t = tablevm.teams[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Expanded(flex: 2, child: Text(t.name)),
                              Expanded(flex: 1, child: Text('${t.played}')),
                              Expanded(flex: 1, child: Text('${t.win}')),
                              Expanded(flex: 1, child: Text('${t.draw}')),
                              Expanded(flex: 1, child: Text('${t.lost}')),
                              Expanded(flex: 1, child: Text('${t.points}')),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
