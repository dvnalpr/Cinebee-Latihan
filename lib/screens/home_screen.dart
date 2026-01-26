import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import '../providers/movie_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch provider movie
    final moviesAsync = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinebee'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Gunakan .when untuk handle Loading, Error, dan Data
      body: moviesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (movies) {
          // --- LOGIC SORTING & FILTERING ---
          // Gunakan List.from() agar list asli tidak teracak-acak saat di-sort

          // 1. New Release (Ambil 5 pertama, asumsi urutan default firestore)
          final newRelease = movies.take(5).toList();

          // 2. Top Rated (Sort by rating descending)
          final topRated = List<Movie>.from(movies)
            ..sort((a, b) => b.rating.compareTo(a.rating));

          // 3. Most Favorited (Sort by favoriteCount descending)
          final mostFavorited = List<Movie>.from(movies)
            ..sort((a, b) => b.favoriteCount.compareTo(a.favoriteCount));

          // ---------------------------------

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Release',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Carousel
                  CarouselSlider.builder(
                    itemCount: newRelease.length,
                    itemBuilder: (context, index, realIndex) {
                      return MovieCard(
                        movie: newRelease[index],
                        type: MovieCardType.large,
                      );
                    },
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0.3,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 280,
                    // Gunakan movies (semua data)
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) => MovieCard(
                        movie: movies[index],
                        type: MovieCardType.small,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    'Top Rated',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // Batasi 4 atau 5 item saja
                      itemCount: topRated.length > 4 ? 4 : topRated.length,
                      itemBuilder: (context, index) => MovieCard(
                        movie: topRated[index],
                        type: MovieCardType.small,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    'Most Favorited',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mostFavorited.length > 4
                          ? 4
                          : mostFavorited.length,
                      itemBuilder: (context, index) => MovieCard(
                        movie: mostFavorited[index],
                        type: MovieCardType.small,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
