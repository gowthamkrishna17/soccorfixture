import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfigVm.dart';
import 'package:flutter/material.dart';

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
