import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return <String>{}; // initial empty set
  }

  void toggleFavorite(String movieId) {
    if (state.contains(movieId)) {
      state = state.where((id) => id != movieId).toSet();
    } else {
      state = {...state, movieId};
    }
  }

  bool isFavorite(String movieId) {
    return state.contains(movieId);
  }
}

final favRiverpod = NotifierProvider<FavNotifier, Set<String>>(() {
  return FavNotifier();
});
