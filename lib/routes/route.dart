import 'package:go_router/go_router.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/screens/screen_home.dart';
import 'package:hisab/screens/screen_site_detail.dart';
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
        path: "/screesite_details",
        builder: (context, state) {
          final site = state.extra as Site;
          return ScreenSiteDetails(site: site);
        }),
  ],
);
