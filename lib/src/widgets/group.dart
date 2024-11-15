import 'package:flutter/material.dart';

import 'expandable_group.dart';

class Group extends StatelessWidget {
  const Group({super.key, required this.num});

  final int num;

  @override
  Widget build(BuildContext context) {
    if (num == 3) {
      return ExpandableGroup(num: num);
    }
    return Container(
      alignment: Alignment.center,
      child: Text("$num"),
    );
  }
}
