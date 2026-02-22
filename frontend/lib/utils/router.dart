import 'package:go_router/go_router.dart';
import '../screens/home.dart';
import '../screens/bathroom_detail.dart';
import '../screens/submit_bathroom.dart';
import '../screens/review.dart';
import '../screens/profile.dart';
import '../screens/auth.dart';


final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/bathroom/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BathroomDetailScreen(bathroomId: id);
    }),
    GoRoute(
      path: '/submit',
      builder: (context, state) => const SubmitBathroomScreen(),
    ),
    GoRoute(
      path: '/review/:bathroomId',
      builder: (context, state) {
        final bathroomId = state.pathParameters['bathroomId']!;
        return ReviewScreen(bathroomId: bathroomId);
      } 
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen()
    ),
  ],
);