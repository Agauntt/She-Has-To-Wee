// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class BathroomDetailScreen extends StatelessWidget {
  final String bathroomId;
  const BathroomDetailScreen({super.key, required this.bathroomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bathroom Details')),
      body: Center(child: Text('Review for $bathroomId')),
    );
  }
}