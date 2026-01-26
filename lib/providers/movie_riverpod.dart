import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie.dart';
import '../repositories/movie_repo.dart';

// Provider untuk Repository (Dependency Injection sederhana)
final movieRepoProvider = Provider((ref) => MovieRepository());

// FutureProvider untuk mengambil data (AsyncValue)
final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repo = ref.read(movieRepoProvider);
  return repo.getMovies();
});
