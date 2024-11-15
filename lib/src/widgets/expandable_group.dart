import 'package:flutter/material.dart';
import '../controllers/expanded_table.dart';

class ExpandableGroup extends StatefulWidget {
  const ExpandableGroup({super.key, required this.num});
  final int num;

  @override
  State<ExpandableGroup> createState() => _ExpandableGroupState();
}

class _ExpandableGroupState extends State<ExpandableGroup> {
  @override
  void initState() {
    super.initState();
    ExpandedTableController().addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: ExpandedTableController().isExpanded
            ? Container(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    _buildDiamond(),
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${widget.num}'),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    _buildDiamond()
                  ],
                ))
            : Container(
                alignment: Alignment.center, child: Text("${widget.num}")));
  }

  Widget _buildDiamond() {
    return Transform.rotate(
      angle: 0.785398,
      child: Container(
        width: 10,
        height: 10,
        color: Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    ExpandedTableController().removeListener(() {
      setState(() {});
    });
    super.dispose();
  }
}
