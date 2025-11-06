import 'package:fixbuilder/CostomWidget/const_Widget.dart';
import 'package:fixbuilder/viewModel/fixConfig_vm/fixConfigVm.dart';
import 'package:flutter/material.dart';

class costomCkeckBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback ontap;
  final bool enable;
  const costomCkeckBox({
    super.key,
    required this.enable,
    required this.countProvider,
    required this.text,
    required this.icon,
    required this.ontap,
    this.color = Colors.amber,
  });

  final FixconfigVm countProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: 1),
        ),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: enable ? Colors.amber : Colors.white,

                border: Border.all(width: 1),
              ),
              child: enable ? Icon(icon) : SizedBox(),
            ),
            constWidth2,
            Text(text),
          ],
        ),
      ),
    );
  }
}
