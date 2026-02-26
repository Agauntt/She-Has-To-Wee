import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _googleSignIn = GoogleSignIn.instance;
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.initialize().then((_) {
      _googleSignIn.authenticationEvents.listen((event) {
        setState(() {
          _currentUser = switch (event) {
            GoogleSignInAuthenticationEventSignIn() => event.user,
            GoogleSignInAuthenticationEventSignOut() => null,
          };
        });
        if (_currentUser != null && mounted) {
          context.go('/home');
        }
      });
      _googleSignIn.attemptLightweightAuthentication();
    });
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.authenticate();
    } catch (e) {
      debugPrint('Sign in error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFE040A0),
        Color(0xFF7B2FBE),
        Color(0xFF4A4AE8),
      ],
    ),
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned.fill(
      // Centered content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'She Has To Wee',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Find clean bathrooms on the road',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 48),
          ElevatedButton.icon(
            onPressed: _handleSignIn,
            icon: const Icon(Icons.login),
            label: const Text('Sign in with Google'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
      ),
      // Image positioned above center
      Positioned(
        top: MediaQuery.of(context).size.height * 0.13,
        child: Image.asset(
          'assets/images/WeeGirl.png',
          width: 250,
          height: 250,
        ),
      ),
    ],
  ),
),
    );
  }
}