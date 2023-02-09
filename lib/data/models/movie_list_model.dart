part of 'models.dart';

class MovieListModel extends Equatable {
  final String id;
  final String title;
  final String dateRelease;
  final String posterPath;
  const MovieListModel(
      {required this.id,
      required this.title,
      required this.dateRelease,
      required this.posterPath});

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      id: (json['id'] ?? '').toString(),
      title: json['original_title'] ?? '',
      dateRelease: json['release_date'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        '"id"': '"$id"',
        '"original_title"': '"$title"',
        '"release_date"': '"$dateRelease"',
        '"poster_path"': '"$posterPath"',
      };

  @override
  List<Object?> get props => [id, posterPath];
}
