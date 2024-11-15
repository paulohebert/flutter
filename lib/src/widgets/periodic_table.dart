import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'group.dart';
import 'lanthanides_actinides_container.dart';
import 'element_cell.dart';
import '../constants/elements.dart';

class PeriodicTable extends StatefulWidget {
  const PeriodicTable({super.key});

  @override
  State<PeriodicTable> createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        controller: _scrollController,
        child: SingleChildScrollView(
          restorationId: "periodic-table",
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: LayoutGrid(
            columnSizes: repeat(18, [auto]),
            rowSizes: [
              40.px,
              ...repeat(7, [1.fr])
            ],
            children: [..._buildGroups(), ..._buildElements()],
          ),
        ));
  }

  List<Widget> _buildGroups() {
    return List.generate(
        18,
        (index) => GridPlacement(
            rowStart: 0,
            columnStart: index,
            child: Group(
              num: index + 1,
            )));
  }

  List<Widget> _buildElements() {
    return List<Widget>.from([
      ...chemicalElements.map((element) => GridPlacement(
            rowStart: element.period,
            columnStart: element.group - 1,
            child: ElementCell(element: element),
          )),
      const GridPlacement(
          rowStart: 6,
          rowSpan: 2,
          columnStart: 2,
          child: LanthanidesActinidesContainer())
    ]);
  }
}
