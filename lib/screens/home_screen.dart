import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newRelease = staticMovies.take(5).toList();
    final topRated = staticMovies..sort((a, b) => b.rating.compareTo(a.rating));
    final mostFavorited = staticMovies
      ..sort((a, b) => b.favoriteCount.compareTo(a.favoriteCount));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinebee'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Release',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: staticMovies.length,
                  itemBuilder: (context, index) => MovieCard(
                    movie: staticMovies[index],
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
                  itemCount: 4,
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
                  itemCount: 4,
                  itemBuilder: (context, index) => MovieCard(
                    movie: mostFavorited[index],
                    type: MovieCardType.small,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
