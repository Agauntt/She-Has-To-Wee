// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleSignOut(BuildContext context) async {
    await GoogleSignIn.instance.signOut();
    if (context.mounted) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('She Has To Wee'), actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _handleSignOut(context),
        )
      ]),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .9,
          children: [
            _HomeCard(
              icon: Icons.map_outlined,
              title: 'Find Nearby',
              description: 'Discover clean bathrooms around you',
              color: const Color(0xFFE040A0),
              onTap: () => context.push('/finder'),
            ),
            _HomeCard(
              icon: Icons.add_location_alt_outlined,
              title: 'Submit a Bathroom',
              description: 'Add a location not in the system',
              color: const Color(0xFF9B3FC8),
              onTap: () => context.push('/submit'),
            ),
            _HomeCard(
              icon: Icons.rate_review_outlined,
              title: 'Leave a Review',
              description: 'Rate a bathroom you just visited',
              color: const Color(0xFF7B2FBE),
              onTap: () => context.push('/review/search'),
            ),
            _HomeCard(
              icon: Icons.person_outline,
              title: 'My Profile',
              description: 'Your reviews, badges and stats',
              color: const Color(0xFF4A4AE8),
              onTap: () => context.push('/profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

@override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}