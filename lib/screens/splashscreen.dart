import 'dart:async';
import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
// import '../screens/favorite_screen.dart';
// import '../screens/profile_screen.dart';
import '../screens/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const AuthGate()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD700),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie, size: 80, color: Colors.black),
            const SizedBox(height: 16),
            Text(
              'Cinebee',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins', // or any font you like
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Main screen with Bottom Nav
// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   int _currentIndex = 0;
//   final screens = const [HomeScreen(), FavoritesScreen(), ProfileScreen()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         selectedItemColor: const Color(0xFFFFD700),
//         unselectedItemColor: Colors.white60,
//         backgroundColor: const Color(0xFF121212),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
