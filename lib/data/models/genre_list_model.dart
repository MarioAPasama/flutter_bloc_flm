part of 'models.dart';

class GenreListModel extends Equatable {
  final String id;
  final String name;

  const GenreListModel({
    required this.id,
    required this.name,
  });

  factory GenreListModel.fromJson(Map<String, dynamic> json) {
    return GenreListModel(
      id: (json['id'] ?? '').toString(),
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}
