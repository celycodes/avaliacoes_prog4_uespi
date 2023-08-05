import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/screens/details_page.dart';
import 'src/screens/home_page.dart';
import 'src/screens/members_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        useMaterial3: false,
      ),
      routes: {
        AppRoutes.homePage: (_) => const HomePage(),
        AppRoutes.membersPage: (_) => const MembersPage(),
        AppRoutes.datailsPage: (_) => const DetailsPage(),
      },
    );
  }
}