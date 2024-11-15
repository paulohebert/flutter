import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/controllers/settings.dart';
import 'src/services/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(PeriodicTableApp(settingsController: settingsController));
}
