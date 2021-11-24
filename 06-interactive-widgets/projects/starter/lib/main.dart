import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      // Add MultiProvider above Home in the element tree
      // so that all descendant widget can use TabManager as Provider
      home: MultiProvider(
        providers: [
          // Add TabManager Provider, propagating changes in Tab selected
          ChangeNotifierProvider(create: (context) => TabManager()),
          // Add GroceryManager Provider, propagating changes in GroceryList
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
