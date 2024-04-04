import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:somo5/home.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 35, 60, 80),
  ));
  WidgetsFlutterBinding.ensureInitialized();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
   runApp(MyApp(savedThemeMode: savedThemeMode));
}

