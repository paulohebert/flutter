import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../models/element_details.dart';

class ElementInfo extends StatelessWidget {
  ElementInfo({super.key, required this.data});

  final ChemicalElementDetails data;

  final GlobalKey modelViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          "Descrição: ${data.summary}",
          softWrap: true,
        ),
      ),
      Expanded(
          child: ModelViewer(
        key: modelViewerKey,
        backgroundColor:
            isDarkTheme ? const Color(0xFF303030) : const Color(0xFFEEEEEE),
        src: 'assets/assets/model3d/${data.symbol}.glb',
        alt: 'Átomo de ${data.name}',
        ar: true,
        autoRotate: true,
        shadowIntensity: 1,
        autoPlay: true,
        disableZoom: true,
        debugLogging: false,
      ))
    ]);
  }
}
