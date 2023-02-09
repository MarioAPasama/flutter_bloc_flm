part of 'models.dart';

class CreditListModel extends Equatable {
  final String name;
  final String profilePath;

  const CreditListModel({
    required this.name,
    required this.profilePath,
  });

  factory CreditListModel.fromJson(Map<String, dynamic> json) {
    return CreditListModel(
      name: json['name'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }

  @override
  List<Object?> get props => [name, profilePath];
}
