import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Set general Theme
    final theme = FooderlichTheme.dark() ;
    // Apply Home widget
    return MaterialApp(
      // set widget theme to general theme
      theme: theme,
      title: 'Fooderlich',
      // set body widget as Home
      home: const Home(),
    );
  }
}