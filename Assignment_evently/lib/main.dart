import 'package:bot_toast/bot_toast.dart';
import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/core/config/routes/route_config.dart';
import 'package:evently/core/config/theme/app_theme_manager.dart';
import 'package:evently/core/providerrr/settings.dart';
import 'package:evently/provider/settings_provider.dart';
import 'package:evently/services/loading_services.dart';
import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Settings()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );

  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event App',
      themeMode:provider.currentThemeMode,
      theme: AppThemeManager.getLightTheme(),
      darkTheme: AppThemeManager.getDarkTheme(),
      initialRoute: AppRoutesName.initialRoute,
      onGenerateRoute: RouteConfig.onGenerateRoute,
      builder: EasyLoading.init(

        builder: BotToastInit(),

      ),
    );
  }
}
