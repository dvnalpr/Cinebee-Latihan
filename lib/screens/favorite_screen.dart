import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/fav_riverpod.dart';
import '../providers/movie_riverpod.dart'; // Import provider movie (Firestore)
import '../widgets/movie_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Ambil List ID yang dilike (Local State)
    final favoriteIds = ref.watch(favRiverpod);

    // 2. Ambil Data Film Lengkap (dari Firestore)
    final moviesAsync = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      // 3. Handle AsyncValue (Loading/Error/Data)
      body: moviesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (allMovies) {
          // 4. Logika Filter: Cocokkan ID film dengan ID favorite
          final favoriteMovies = allMovies
              .where((m) => favoriteIds.contains(m.id))
              .toList();

          if (favoriteMovies.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Favorites',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  // Gunakan Expanded agar ListView mengisi sisa ruang
                  child: ListView.builder(
                    // Ubah ke vertical agar terlihat seperti list favorite pada umumnya
                    // atau biarkan horizontal jika design Anda memang begitu
                    scrollDirection: Axis.vertical,
                    itemCount: favoriteMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: MovieCard(
                          movie: favoriteMovies[index],
                          type: MovieCardType.large, // Tampilkan agak besar
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
