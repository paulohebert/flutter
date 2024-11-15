import 'dart:math';

import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell(
      {super.key,
      required this.child,
      required this.colors,
      required this.onTap});

  final Widget child;
  final List<Color> colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: max(MediaQuery.sizeOf(context).width / 18, 85),
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.25),
                  gradient: RadialGradient(
                    center: const Alignment(0.7, -0.5),
                    radius: 1.4,
                    colors: colors,
                  )),
              child: SizedBox.expand(child: child),
            )),
      ),
    );
  }
}
