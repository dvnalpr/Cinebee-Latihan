import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final int year;
  final double rating;
  final int favoriteCount;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.year,
    this.rating = 0.0,
    this.favoriteCount = 0,
  });

  factory Movie.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Movie(
      id: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      year: data['year'] ?? 0,
      rating: (data['rating'] ?? 0.0).toDouble(),
      favoriteCount: data['favoriteCount'] ?? 0,
    );
  }
}
