// import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfig_vm.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Costomtextfeild extends StatelessWidget {
  final String title;
  final double width;
  final TextEditingController? controller;

  const Costomtextfeild({
    super.key,
    required this.title,

    required this.width,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(title),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class costomContainer extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  final Color textColor;
  final Color color;

  const costomContainer({
    super.key,
    required this.title,
    this.ontap,
    this.color = Colors.transparent,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<FixconfigVm>(context);

    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1),
            top: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
          ),
        ),
        child: Text(title, style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
