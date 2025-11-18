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
}

final List<Movie> staticMovies = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    year: 2024,
    rating: 8.5,
    favoriteCount: 1200,
  ),
  Movie(
    id: '2',
    title: 'Oppenheimer',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    year: 2023,
    rating: 9.0,
    favoriteCount: 1500,
  ),
  Movie(
    id: '3',
    title: 'Barbie',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
    year: 2023,
    rating: 7.5,
    favoriteCount: 800,
  ),
  Movie(
    id: '4',
    title: 'The Boys',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg',
    year: 2019,
    rating: 8.0,
    favoriteCount: 950,
  ),
  Movie(
    id: '5',
    title: 'Avatar: The Way of Water',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
    year: 2022,
    rating: 7.8,
    favoriteCount: 1100,
  ),
  Movie(
    id: '6',
    title: 'Superman',
    imageUrl:
        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/wPLysNDLffQLOVebZQCbXJEv6E6.jpg',
    year: 2025,
    rating: 8.2,
    favoriteCount: 700,
  ),
  Movie(
    id: '7',
    title: 'Spider-Man: Across the Spider-Verse',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
    year: 2023,
    rating: 8.2,
    favoriteCount: 700,
  ),
  Movie(
    id: '8',
    title: 'The Batman',
    imageUrl:
        'https://media.themoviedb.org/t/p/w94_and_h141_bestv2/74xTEgt7R36Fpooo50r9T25onhq.jpg',
    year: 2022,
    rating: 8.2,
    favoriteCount: 700,
  ),
];
