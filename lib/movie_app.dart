import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:movieapp/hom/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "muli",
          colorScheme: const ColorScheme.highContrastLight()),
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
