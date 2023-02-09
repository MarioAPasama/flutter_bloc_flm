part of 'models.dart';

class MovieDetailModel extends Equatable {
  final String id;
  final String homepage;
  final String originalTitle;
  final List<GenreListModel> genres;
  final String originalLanguage;
  final String releaseDate;
  final String overview;
  final String backdropPath;
  final double voteAverage;

  const MovieDetailModel({
    required this.id,
    required this.homepage,
    required this.originalTitle,
    required this.genres,
    required this.originalLanguage,
    required this.releaseDate,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'].toString(),
      homepage: json['homepage'] ?? '',
      originalTitle: json['original_title'] ?? '',
      genres: List<GenreListModel>.from(
          json['genres'].map((e) => GenreListModel.fromJson(e))),
      originalLanguage: json['original_language'] ?? '',
      releaseDate: json['release_date'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      voteAverage: json['vote_average'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        homepage,
        originalTitle,
        genres,
        originalLanguage,
        releaseDate,
        overview,
        backdropPath,
        voteAverage
      ];
}
