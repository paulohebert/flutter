import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SimpleDialog(
      elevation: 20,
      semanticLabel: "Sobre",
      insetPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.only(top: 20),
      title: Container(
        alignment: Alignment.center,
        height: 50,
        child: rive.RiveAnimation.asset(
          "assets/images/about.riv",
          artboard: isDarkTheme ? "dark" : "light",
          placeHolder: const CircularProgressIndicator(),
          antialiasing: true,
          fit: BoxFit.contain,
        ),
      ),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    'A Tabela Periódica Interativa foi desenvolvida como parte de extensão por discentes do curso de Engenharia de Computação da UNIVASF e tem como objetivo apoiar o ensino de Química no Colégio Rui Barbosa, proporcionando uma ferramenta interativa e acessível para o estudo dos elementos químicos.',
                    textAlign: TextAlign.center,
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            Wrap(
                              spacing: 5,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.code),
                                Text(
                                  'Desenvolvedores',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Wrap(
                                  spacing: 7,
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text('Gabriel Rocha Palha'),
                                    Text('Pablo Vinicius Rodrigues Barboza'),
                                    Text('Paulo Hebert Rodrigues do Amaral'),
                                    Text('Pedro Vinícius de Souza Araújo'),
                                  ],
                                ))
                          ]))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            Wrap(
                              spacing: 5,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.supervisor_account_rounded),
                                Text(
                                  'Orientadores',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Wrap(
                                  spacing: 7,
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text('Ricardo Argenton Ramos'),
                                    Text('Maria de Fátima Souza Silva'),
                                  ],
                                ))
                          ])))
                ],
              ),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Wrap(
                        spacing: 70,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Image.asset(
                            isDarkTheme
                                ? "assets/images/univasf-white.png"
                                : "assets/images/univasf-black.png",
                            height: 55,
                          ),
                          Image.asset(
                            isDarkTheme
                                ? "assets/images/ruibarbosa.jpg"
                                : "assets/images/ruibarbosa-transparent.png",
                            height: 100,
                          ),
                        ],
                      )))
            ],
          ),
        )
      ],
    );
  }
}
