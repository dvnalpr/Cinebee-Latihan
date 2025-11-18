import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpods/fav_riverpod.dart';
import '../models/movie.dart';

enum MovieCardType { small, large }

class MovieCard extends ConsumerWidget {
  final Movie movie;
  final MovieCardType type;

  const MovieCard({
    super.key,
    required this.movie,
    this.type = MovieCardType.small,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favRiverpod).contains(movie.id);
    final notifier = ref.read(favRiverpod.notifier);

    double width = type == MovieCardType.large ? double.infinity : 140;
    double height = type == MovieCardType.large ? 300 : 210;
    double borderRadius = type == MovieCardType.large ? 16.0 : 12.0;
    double titleFontSize = type == MovieCardType.large ? 20.0 : 14.0;
    double yearFontSize = type == MovieCardType.large ? 14.0 : 12.0;
    double heartSize = type == MovieCardType.large ? 20.0 : 18.0;
    double heartContainerSize = type == MovieCardType.large ? 36.0 : 32.0;

    return Container(
      width: width,
      margin: type == MovieCardType.large
          ? const EdgeInsets.symmetric(horizontal: 8)
          : const EdgeInsets.only(right: 16),
      decoration: type == MovieCardType.large
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            )
          : null,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              movie.imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[800],
                width: width,
                height: height,
                child: Center(
                  child: Text(
                    movie.title.split(' ').first,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (type == MovieCardType.large)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: type == MovieCardType.large ? 16 : 6,
            left: type == MovieCardType.large ? 16 : 0,
            right: type == MovieCardType.large ? 16 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                  ),
                  maxLines: type == MovieCardType.large ? 2 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  movie.year.toString(),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: yearFontSize,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: type == MovieCardType.large ? 16 : 8,
            right: type == MovieCardType.large ? 16 : 8,
            child: GestureDetector(
              onTap: () => notifier.toggleFavorite(movie.id),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: heartContainerSize,
                height: heartContainerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFavorite
                      ? Colors.red.withValues(alpha: 0.8)
                      : Colors.white.withValues(alpha: 0.3),
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: heartSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
