import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/element_details.dart';
import '../widgets/element_info.dart';

class ElementDetailsScreen extends StatelessWidget {
  const ElementDetailsScreen(
      {super.key, required this.name, required this.symbol});

  static const routeName = '/element_details';

  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return Material(
                  color: Colors.transparent,
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: isDarkTheme ? Colors.white : Colors.black),
                  child: FittedBox(
                      alignment: Alignment.center, child: Text(name)));
            },
            tag: name,
            child: Text(name),
          ),
        ),
        body: FutureBuilder<ChemicalElementDetails>(
            future: _loadElementData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar os dados'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Nenhum dado encontrado'));
              } else {
                return ElementInfo(data: snapshot.data!);
              }
            }));
  }

  Future<ChemicalElementDetails> _loadElementData() async {
    final String response =
        await rootBundle.loadString('assets/json/$symbol.json');
    final Map<String, dynamic> data = json.decode(response);
    return ChemicalElementDetails.fromJson(data);
  }
}
