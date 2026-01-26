import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/movie.dart';

class MovieRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Movie>> getMovies() async {
    try {
      // Mengambil collection 'movies'
      QuerySnapshot snapshot = await _firestore.collection('movies').get();

      // Mapping dari document menjadi list of Movie
      return snapshot.docs.map((doc) => Movie.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Gagal mengambil data film: $e');
    }
  }
}
