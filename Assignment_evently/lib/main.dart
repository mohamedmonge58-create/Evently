import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/routes/route_config.dart';
import 'package:evently/core/config/theme/app_theme_manager.dart';
import 'package:evently/modules/event/event_details.dart';
import 'package:evently/modules/event/event_edit.dart';
import 'package:evently/modules/splash_screen/splash_view.dart';
import 'package:evently/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event App',
      themeMode: ThemeMode.light,
      theme: AppThemeManager.getLightTheme(),
      darkTheme: AppThemeManager.getDarkTheme(),
      // initialRoute: AppRoutesName.initialRoute,
      // onGenerateRoute: RouteConfig.onGenerateRoute,
      home: EventEdit(),
    );
  }
}
