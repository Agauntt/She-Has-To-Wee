import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'utils/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'She Has To Wee',
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 6, 242)),
        useMaterial3: true
      ),
      routerConfig: appRouter,
    );
  }
}