import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/providers/shoes_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shoes_app/screens/screens.dart';
import 'package:flutter_shoes_app/theme/custom_theme.dart';

void main() => runApp(const MyProvider());

class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoesProvider(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customTheme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
