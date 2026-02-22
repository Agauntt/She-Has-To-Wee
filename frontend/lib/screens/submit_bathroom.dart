// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class SubmitBathroomScreen extends StatelessWidget {
  const SubmitBathroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Bathroom')),
      body: const Center(child: Text('Bathroom submission form goes here')),
    );
  }
}