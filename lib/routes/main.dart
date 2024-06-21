import 'package:go_router/go_router.dart';
import 'package:hisab/widgets/pages/home_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
    ),
  ],
);
