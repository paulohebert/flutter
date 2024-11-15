import 'package:flutter/material.dart';
import '../constants/color_palette.dart';
import '../screens/element_details.dart';
import '../models/element.dart';
import 'cell.dart';

class ElementCell extends StatelessWidget {
  const ElementCell({super.key, required this.element, this.onTap});

  final ChemicalElement element;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Cell(
        colors: colors[element.category] ?? [],
        onTap: () {
          Navigator.restorablePushNamed(context, ElementDetailsScreen.routeName,
              arguments: {
                'name': element.name,
                'symbol': element.symbol,
              });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${element.atomicNumber}",
                          style: const TextStyle(color: Colors.white),
                        ))),
                Expanded(
                    flex: 2,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          element.symbol,
                          textScaler: const TextScaler.linear(3),
                          style: const TextStyle(color: Colors.white),
                        ))),
                Expanded(
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Hero(
                            flightShuttleBuilder: (flightContext,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext) {
                              return Material(
                                  color: Colors.transparent,
                                  child: Center(child: Text(element.name)));
                            },
                            tag: element.name,
                            child: Text(
                              element.name,
                              style: const TextStyle(color: Colors.white),
                            ))))
              ],
            )));
  }
}
