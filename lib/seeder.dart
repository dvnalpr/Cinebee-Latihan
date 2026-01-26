import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Pastikan file ini ada (hasil flutterfire configure)

// --- IMPORT DATA STATIC ANDA DI SINI ---
// import 'models/movie.dart';
// atau copas list staticMovies di bagian bawah file ini
// ---------------------------------------

// CONTOH DATA (Ganti ini dengan import staticMovies Anda yang asli)
final List<Map<String, dynamic>> dataMoviesToUpload = [
  {
    "id": '1',
    "title": 'Dune: Part Two',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    "year": 2024,
    "rating": 8.5,
    "favoriteCount": 1200,
  },
  {
    "id": '2',
    "title": 'Oppenheimer',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    "year": 2023,
    "rating": 9.0,
    "favoriteCount": 1500,
  },
  {
    "id": '3',
    "title": 'Barbie',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
    "year": 2023,
    "rating": 7.5,
    "favoriteCount": 800,
  },
  {
    "id": '4',
    "title": 'The Boys',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg',
    "year": 2019,
    "rating": 8.0,
    "favoriteCount": 950,
  },
  {
    "id": '5',
    "title": 'Avatar: The Way of Water',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
    "year": 2022,
    "rating": 7.8,
    "favoriteCount": 1100,
  },
  {
    "id": '6',
    "title": 'Superman',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/wPLysNDLffQLOVebZQCbXJEv6E6.jpg',
    "year": 2025,
    "rating": 8.2,
    "favoriteCount": 700,
  },
  {
    "id": '7',
    "title": 'Spider-Man: Across the Spider-Verse',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
    "year": 2023,
    "rating": 8.2,
    "favoriteCount": 700,
  },
  {
    "id": '8',
    "title": 'The Batman',
    "imageUrl":
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    "year": 2022,
    "rating": 8.2,
    "favoriteCount": 700,
  },
];

void main() async {
  // 1. Inisialisasi Binding Flutter & Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print("------------------------------------------------");
  print("🚀 MEMULAI PROSES SEEDING/UPLOAD DATA...");
  print("------------------------------------------------");

  // 2. Referensi ke Firestore
  final CollectionReference moviesRef = FirebaseFirestore.instance.collection(
    'movies',
  );

  int successCount = 0;
  int failCount = 0;

  // 3. Loop dan Upload
  // Ganti 'dataMoviesToUpload' dengan variabel 'staticMovies' Anda jika sudah di-import
  for (var movieData in dataMoviesToUpload) {
    try {
      // Kita pakai .add() agar ID dibuat otomatis oleh Firestore
      // Pastikan key (sebelah kiri) SAMA PERSIS dengan field yang diminta Model Anda
      await moviesRef.add({
        'title': movieData['title'], // Sesuaikan dengan properti object Anda
        'imageUrl': movieData['imageUrl'],
        'year': movieData['year'],
        'rating': movieData['rating'],
        'favoriteCount': movieData['favoriteCount'],
      });

      print("✅ Berhasil upload: ${movieData['title']}");
      successCount++;
    } catch (e) {
      print("❌ Gagal upload ${movieData['title']}: $e");
      failCount++;
    }
  }

  print("------------------------------------------------");
  print("🏁 SELESAI!");
  print("📊 Sukses: $successCount, Gagal: $failCount");
  print("------------------------------------------------");

  // Keluar dari aplikasi (opsional, visual saja)
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Data Uploaded! Cek Terminal.",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
