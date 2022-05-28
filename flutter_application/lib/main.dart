import 'package:flutter/material.dart';
import 'package:flutter_application/src/model/golf.dart';
import 'package:flutter_application/src/service/golf_service.dart';

import 'src/app.dart';
import 'src/controller/settings_controller.dart';
import 'src/service/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  List<Golf> golfCourses = await GolfService.getGolfCourses();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
      settingsController: settingsController, golfCourse: golfCourses[0]));
}
