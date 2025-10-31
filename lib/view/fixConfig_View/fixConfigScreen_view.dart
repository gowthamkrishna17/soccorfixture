import 'package:fixbuilder/CostomWidget/constWidget.dart';
import 'package:fixbuilder/CostomWidget/costomtextFeild.dart';
import 'package:fixbuilder/view/LeagueConfig_View/leagueConfigScreen_view.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfig_vm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FixconfigscreenView extends StatelessWidget {
  const FixconfigscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<FixconfigVm>(context);
    final leagueProvider = Provider.of<Leaguevm>(context);
    return Scaffold(
      appBar: AppBar(elevation: 1, title: const Text('Create tournament')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Tournament nameee'),
                  border: OutlineInputBorder(),
                ),
              ),
              constHeight10,

              //time and date
              Container(
                height: 170,
                decoration: BoxDecoration(border: Border.all(width: 1)),
              ),

              //image picker
              constHeight10,
              Row(
                children: [
                  Costomtextfeild(
                    title: 'team count',
                    width: 100,
                    controller: countProvider.teamCount,
                  ),
                  IconButton(
                    onPressed: countProvider.updateCount,
                    icon: Icon(Icons.check),
                  ),
                ],
              ),
              constHeight5,
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: countProvider.toggleLeague,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,

                            border: Border.all(width: 1),
                          ),
                          height: 30,
                          child: const Text(
                            'League',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: countProvider.toggleKnockout,
                        child: Container(
                          height: 30,

                          color: Colors.red,
                          child: Text('Knockout', textAlign: constTxtcenter),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              countProvider.enblleague
                  ? Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,

                      border: Border.all(width: 1),
                    ),
                    padding: const EdgeInsets.only(top: 5),
                    height: 100,
                    child: Column(
                      children: [
                        const Text('league table settings'),
                        Row(
                          spacing: 1.5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costomContainer(title: 'team'),
                            costomContainer(title: 'PLAY'),
                            costomContainer(title: 'WIN'),
                            costomContainer(title: 'DRAW'),
                            costomContainer(title: 'LOSE'),
                            costomContainer(
                              color:
                                  countProvider.enableGS
                                      ? Colors.transparent
                                      : Colors.grey,
                              title: 'GOAL SCR',
                            ),
                            costomContainer(
                              color:
                                  countProvider.enableGc
                                      ? Colors.transparent
                                      : Colors.grey,
                              title: 'GOAL CONSID',
                            ),
                            costomContainer(
                              color: Colors.red,
                              title: 'GOAL DIF',
                            ),
                            costomContainer(title: 'POINT'),
                          ],
                        ),
                        SizedBox(height: 4),

                        leagueTableconfig(countProvider: countProvider),
                      ],
                    ),
                  )
                  : Container(color: Colors.red, height: 100),
              constHeight10,

              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: countProvider.teamc,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final provider = countProvider.feild[index];
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 87, 190, 17),
                      ),
                      Costomtextfeild(
                        controller: provider,
                        title: 'Team${index + 1}',
                        width: 250,
                      ),
                      IconButton(
                        onPressed: () {
                          countProvider.deleletTeam(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  );
                },
              ),
              constHeight10,

              constHeight10,
              constHeight10,

              constHeight10,
              constHeight10,

              constHeight10,
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.blueAccent,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20, top: 10),

        child: InkWell(
          onTap: () {
            List<String> teams =
                countProvider.feild
                    .map((c) => c.text.trim())
                    .where((name) => name.isNotEmpty)
                    .toSet()
                    .toList();
            print('Team :$teams');

            leagueProvider.generateFixture(teams);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LeagueconfigscreenView()),
            );
          },
          child: Container(
            height: 40,
            width: 250,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1),
              color: Colors.blueGrey,
            ),
            child: Center(child: const Text('Continue')),
          ),
        ),
      ),
    );
  }
}

class leagueTableconfig extends StatelessWidget {
  const leagueTableconfig({super.key, required this.countProvider});

  final FixconfigVm countProvider;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.blueGrey),
          children: [
            Center(child: Text('Team')),

            Center(child: Text('PL')),
            Center(child: Text('WN')),
            Center(child: Text('DR')),
            Center(child: Text('LS')),
            if (countProvider.enableGS = true) Center(child: Text('GS')),

            countProvider.enableGc ? Center(child: Text('GC')) : SizedBox(),
            countProvider.enableGd ? Center(child: Text('GD')) : SizedBox(),
            Center(child: Text('PT')),
          ],
        ),
        TableRow(
          children: [
            Center(child: Text('barca')),
            Center(child: Text('3')),
            Center(child: Text('1')),
            Center(child: Text('1')),

            Center(child: Text('1')),

            if (countProvider.enableGS = true) Center(child: Text('2')),

            countProvider.enableGc ? Center(child: Text('1')) : SizedBox(),
            countProvider.enableGd ? Center(child: Text('1')) : SizedBox(),
            Center(child: Text('4')),
          ],
        ),
      ],
    );
  }
}
