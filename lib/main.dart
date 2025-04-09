import 'package:cx_app/resources/colors.dart';
import 'package:cx_app/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Appcolors.lighBackgroundColor,
        iconTheme: IconThemeData(color: Appcolors.textColor),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Appcolors.textColor),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
