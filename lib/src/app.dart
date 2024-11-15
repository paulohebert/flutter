import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'controllers/settings.dart';
import 'screens/element_details.dart';
import 'screens/home.dart';
import 'screens/settings.dart';

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          home: const HomeScreen(),
          title: "Tabela Periódica",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return PageRouteBuilder<void>(
                settings: routeSettings,
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  switch (routeSettings.name) {
                    case SettingsScreen.routeName:
                      return SettingsScreen(controller: settingsController);
                    case ElementDetailsScreen.routeName:
                      final args = routeSettings.arguments;
                      if (args is! Map<String, String>) {
                        return const HomeScreen();
                      }
                      return ElementDetailsScreen(
                        name: args['name'] ?? '',
                        symbol: args['symbol'] ?? '',
                      );
                    case HomeScreen.routeName:
                    default:
                      return const HomeScreen();
                  }
                },
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                });
          },
        );
      },
    );
  }
}
