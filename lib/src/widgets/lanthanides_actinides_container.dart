import 'package:flutter/material.dart';
import '../constants/elements.dart';
import '../controllers/expanded_table.dart';
import '../models/element.dart';
import '../widgets/element_cell.dart';
import '../widgets/cell.dart';

class LanthanidesActinidesContainer extends StatefulWidget {
  const LanthanidesActinidesContainer({super.key});

  @override
  State<LanthanidesActinidesContainer> createState() =>
      _LanthanidesActinidesContainerState();
}

class _LanthanidesActinidesContainerState
    extends State<LanthanidesActinidesContainer> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildElementRow(
          title: "57 - 71",
          subtitle: "Lantanídeos",
          elements: lanthanides,
        ),
        _buildElementRow(
          title: "89 - 103",
          subtitle: "Actinídeos",
          elements: actinides,
        ),
      ],
    );
  }

  Widget _buildElementRow({
    required String title,
    required String subtitle,
    required List<ChemicalElement> elements,
  }) {
    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Cell(
            colors: const [
              Color.fromARGB(255, 36, 160, 29),
              Color.fromARGB(255, 58, 151, 78)
            ],
            onTap: () {
              setState(() {
                _active = !_active;
                ExpandedTableController().toggleExpanded();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: _active
                ? Row(
                    children: elements
                        .map((element) => ElementCell(element: element))
                        .toList(),
                  )
                : Container(),
          ),
        ],
      ),
    ));
  }
}
