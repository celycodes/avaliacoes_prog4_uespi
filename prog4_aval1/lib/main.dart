import 'package:flutter/material.dart';

import 'src/screen/jokenpo_home_page.dart';
import 'src/screen/splash_screen.dart';


void main() => runApp(const JokenpoGame());

class JokenpoGame extends StatelessWidget {
  const JokenpoGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpo Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const JokenpoHomePage(),
      },
    );
  }
}