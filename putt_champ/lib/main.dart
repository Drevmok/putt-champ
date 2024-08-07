import 'package:flutter/material.dart';

void main() {
  runApp(const PuttChampApp());
}

class PuttChampApp extends StatelessWidget {
  const PuttChampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuttChamp App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PuttChamp')),
      body: const Center(child: Text('Welcome to PuttChamp!')),
    );
  }
}
