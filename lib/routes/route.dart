import 'package:go_router/go_router.dart';
import 'package:hisab/screens/screen_home.dart';
import 'package:hisab/screens/screen_site_details.dart';
import 'package:hisab/screens/screen_site_list.dart';

import '../screens/screen_firm_list.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ScreenHome(),
    ),
    GoRoute(
      path: "/firms",
      builder: (context, state) => const ScreenFirmListing(),
    ),
    GoRoute(
      path: "/sites",
      builder: (context, state) => const ScreenSiteListing(),
    ),
    GoRoute(
      path: "/sites/id",
      builder: (context, state) => const ScreenSiteDetails(),
    )
  ],
);
