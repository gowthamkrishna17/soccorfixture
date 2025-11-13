import 'package:fixbuilder/view/fixConfig_View/fixConfigScreen_view.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/calenderVM.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfigVm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueTable_vm.dart';
import 'package:fixbuilder/viewModel/league_vm/leagueVM.dart';
import 'package:fixbuilder/viewModel/league_vm/liveMatchVm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FixconfigVm()),
        ChangeNotifierProvider(create: (context) => Leaguevm()),
        ChangeNotifierProvider(create: (context) => VmLeagueTable()),
        ChangeNotifierProvider(create: (context) => Calendervm()),
        // ChangeNotifierProvider(create: (context) => Livematchvm()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugShowPerformanceOverlay:
    // true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FixconfigscreenView(),
    );
  }
}
