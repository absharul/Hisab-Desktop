import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/theme.dart';

final AppDatabase database = AppDatabase();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hisab',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
    // return MaterialApp(
    //   home: Todos(),
    // );
  }
}
