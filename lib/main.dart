import 'package:calculator/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainscreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(isDarkMode: true),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themePorvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: themePorvider.getTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
