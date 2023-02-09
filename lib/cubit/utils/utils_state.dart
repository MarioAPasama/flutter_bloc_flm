part of 'utils_cubit.dart';

abstract class UtilsState extends Equatable {
  const UtilsState();

  @override
  List<Object> get props => [];
}

class ListGenreLoaded extends UtilsState {
  final List<GenreListModel> genreListModel;
  const ListGenreLoaded({required this.genreListModel});

  @override
  List<Object> get props => [genreListModel];
}

class IsSarch extends UtilsState {
  final bool isSarch;
  const IsSarch({required this.isSarch});

  @override
  List<Object> get props => [isSarch];
}

class UtilsInitial extends UtilsState {}
