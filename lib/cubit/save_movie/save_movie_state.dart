part of 'save_movie_cubit.dart';

abstract class SaveMovieState extends Equatable {
  const SaveMovieState();

  @override
  List<Object> get props => [];
}

class SaveMovie extends SaveMovieState {
  final bool isSave;

  const SaveMovie({required this.isSave});

  @override
  List<Object> get props => [isSave];
}

class SaveMovieInitial extends SaveMovieState {}
