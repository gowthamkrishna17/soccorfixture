import 'package:fixbuilder/CostomWidget/constCheckbox.dart';
import 'package:fixbuilder/CostomWidget/const_Widget.dart';
import 'package:fixbuilder/CostomWidget/costomButton.dart';
import 'package:fixbuilder/CostomWidget/costom_textFeild.dart';
import 'package:fixbuilder/view/LeagueConfig_View/leagueConfigScreen_view.dart';
import 'package:fixbuilder/view/fixConfig_View/leagueTableconfig.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfigVm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueTable_vm.dart';
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
              countProvider.enbleposter
                  ? Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(width: 1),
                    ),
                  )
                  : SizedBox(),

              //image picker
              constHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'TeamCount',
                                hintStyle: TextStyle(
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              controller: countProvider.teamCount,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: countProvider.updateCount,
                          icon: Icon(Icons.check),
                        ),
                      ],
                    ),
                  ),

                  costomCkeckBox(
                    enable: countProvider.enblLogo,
                    countProvider: countProvider,
                    text: 'LOGO',
                    ontap: countProvider.toggleLogo,
                    icon: Icons.wrong_location,
                  ),
                  constWidth5,
                  costomCkeckBox(
                    enable: countProvider.enbleposter,
                    countProvider: countProvider,
                    text: 'poster',
                    icon: Icons.browse_gallery,
                    ontap: () {
                      countProvider.togglePosetr();
                    },
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
                            CostomContainer(title: 'team'),
                            CostomContainer(title: 'PLAY'),
                            CostomContainer(title: 'WIN'),
                            CostomContainer(title: 'DRAW'),
                            CostomContainer(title: 'LOSE'),
                            CostomContainer(
                              color:
                                  countProvider.enableGS
                                      ? Colors.transparent
                                      : Colors.grey,
                              title: 'GOAL SCR',
                            ),
                            CostomContainer(
                              color:
                                  countProvider.enableGc
                                      ? Colors.transparent
                                      : Colors.grey,
                              title: 'GOAL CONSID',
                            ),
                            CostomContainer(
                              color: Colors.red,
                              title: 'GOAL DIF',
                            ),
                            CostomContainer(title: 'POINT'),
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        countProvider.enblLogo
                            ? CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color.fromARGB(
                                255,
                                87,
                                190,
                                17,
                              ),
                            )
                            : SizedBox(),
                        Costomtextfeild(
                          controller: provider,
                          title: 'Team${index + 1}',
                          width: countProvider.enblLogo ? 250 : 300,
                        ),
                        IconButton(
                          onPressed: () {
                            countProvider.deleletTeam(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
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
            final names =
                countProvider.feild
                    .map((controller) => controller.text)
                    .toList();
            context.read<Leaguevm>().generateFixture(names);
            context.read<VmLeagueTable>().setTeams(names);

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
          child: costomButton(),
        ),
      ),
    );
  }
}
