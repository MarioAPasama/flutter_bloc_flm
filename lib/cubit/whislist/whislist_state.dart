part of 'whislist_cubit.dart';

abstract class WhislistState extends Equatable {
  const WhislistState();

  @override
  List<Object> get props => [];
}

class ListMovieWhislistLoaded extends WhislistState {
  final List<MovieListModel> movieListModel;
  final bool isLoaded;
  const ListMovieWhislistLoaded(
      {required this.movieListModel, required this.isLoaded});

  @override
  List<Object> get props => [movieListModel, isLoaded];
}

class WhislistInitial extends WhislistState {}
