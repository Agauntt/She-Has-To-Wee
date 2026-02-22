// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final String bathroomId;
  const ReviewScreen({super.key, required this.bathroomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Bathroom')),
      body: const Center(child: Text('Review bathroom details go here')),
    );
  }
}