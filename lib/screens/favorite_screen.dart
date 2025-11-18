import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpods/fav_riverpod.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favRiverpod);
    final favoriteMovies = staticMovies
        .where((m) => favoriteIds.contains(m.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoriteMovies.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Favorites',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: favoriteMovies.length,
                      itemBuilder: (context, index) =>
                          MovieCard(movie: favoriteMovies[index]),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
