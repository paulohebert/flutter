import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

import '../widgets/about.dart';
import '../widgets/periodic_table.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          height: 70,
          child: rive.RiveAnimation.asset(
            "assets/images/logo.riv",
            artboard: isDarkTheme ? "dark" : "light",
            placeHolder: const CircularProgressIndicator(),
            antialiasing: true,
            fit: BoxFit.contain,
          ),
        ),
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.info_outline_rounded),
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return const About();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
      body: const SafeArea(child: PeriodicTable()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            builder: (BuildContext context) {
              return SizedBox(
                height: 280,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Center(
                        child: Text(
                          'Grupos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: const Color(0xFF4BD169),
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Text('Metais'),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, size: 20),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        titlePadding: EdgeInsets.zero,
                                        contentPadding:
                                            const EdgeInsets.all(16.0),
                                        title: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/metais.webp'),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                            ),
                                            const Text('Metais',
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        content: const Text(
                                            'Os metais na Tabela Periódica formam a maior parte dos elementos e são conhecidos por sua condutividade elétrica e térmica, brilho metálico e maleabilidade. Eles têm baixa afinidade eletrônica, ou seja, tendem a perder elétrons em vez de ganhá-los, formando cátions e se ligando facilmente a elementos de alta eletronegatividade, como os não metais (especialmente halogênios e oxigênio).\nO ouro (Au) é um exemplo de metal nobre conhecido por sua alta resistência à corrosão e excelente condutividade elétrica.', textAlign: TextAlign.justify),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Fechar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 1.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: const Color(0xFFF0B214),
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Text('Semimetais'),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, size: 20),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        titlePadding: EdgeInsets.zero,
                                        contentPadding:
                                            const EdgeInsets.all(16.0),
                                        title: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/semimetais.gif'),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                            ),
                                            const Text('Semimetais',
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        content: const Text(
                                            'Os semimetais (ou metaloides) são elementos localizados em uma região de transição entre os metais e os não metais na Tabela Periódica. Eles possuem afinidade eletrônica variável, mas geralmente formam ligações mais facilmente com elementos não metálicos, como os halogênios e o oxigênio, devido à sua capacidade de compartilhar ou aceitar elétrons para completar seus orbitais. \nO boro (B) é um exemplo de semimetal amplamente utilizado em materiais resistentes ao calor, como os vidros de borossilicato, frequentemente empregados na fabricação de béqueres para a realização de experimentos em laboratório.', textAlign: TextAlign.justify),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Fechar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 1.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: const Color(0xFFF07014),
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Text('Não-metais'),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline, size: 20),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        titlePadding: EdgeInsets.zero,
                                        contentPadding:
                                            const EdgeInsets.all(16.0),
                                        title: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/naometais.gif'),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                            ),
                                            const Text('Não-metais',
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        content: const Text(
                                            'Os Não-metais são elementos caracterizados por não conduzirem eletricidade, serem isolantes térmicos e, em muitos casos, existirem em estado gasoso. Eles possuem alta afinidade eletrônica, o que significa que tendem a ganhar elétrons em reações químicas, formando ligações covalentes com outros não metais. A afinidade eletrônica é mais alta com elementos que compartilham características semelhantes, como outros não metais. \nO diamante, especificamente, é formado quando o carbono (C) é submetido a condições extremas de alta pressão e alta temperatura, que ocorrem naturalmente nas profundezas da crosta terrestre, a mais de 150 km de profundidade.', textAlign: TextAlign.justify),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Fechar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 71, 89),
                      ),
                      child: const Text(
                        'X',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Informações',
        shape: const CircleBorder(),
        child: const Icon(Icons.assessment_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 20,
        height: 50,
        notchMargin: 10,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              isDarkTheme
                  ? Image.asset("assets/images/univasf-white.png")
                  : Image.asset("assets/images/univasf-black.png")
            ],
          ),
        ),
      ),
    );
  }
}
