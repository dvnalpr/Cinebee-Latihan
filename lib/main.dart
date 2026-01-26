import 'package:firebase_core/firebase_core.dart';
import 'package:project_cinebeev1/screens/signin_screen.dart';
import '/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/splashscreen.dart';
import '../widgets/app_themes.dart';
// import 'screens/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebee',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {'/sign-in': (context) => const SignInScreen()},
    );
  }
}
