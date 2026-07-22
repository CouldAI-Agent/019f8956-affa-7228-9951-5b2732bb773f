import 'package:flutter/material.dart';
import 'layout/main_layout.dart';

void main() {
  runApp(const FreightForwardApp());
}

class FreightForwardApp extends StatelessWidget {
  const FreightForwardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freight Forward',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
      },
    );
  }
}
