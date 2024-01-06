// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_experts/routes/app_routes.dart';

// import 'package:flutter/dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

ThemeData _baseTheme = ThemeData(
  fontFamily: "Roboto",
  canvasColor: Colors.white,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _baseTheme,
      title: 'marriyoo_virtual_experts',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.oneSplashScreen,
      routes: AppRoutes.routes,
    );
  }
}

