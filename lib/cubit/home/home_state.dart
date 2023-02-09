part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class ListMovieLoaded extends HomeState {
  final List<MovieListModel> movieListModel;
  final bool isLoaded;
  const ListMovieLoaded({required this.movieListModel, required this.isLoaded});

  @override
  List<Object> get props => [movieListModel, isLoaded];
}

class HomeInitial extends HomeState {}
