part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class ListCategoryLoaded extends CategoryState {
  final List<MovieListModel> movieListModel;
  final bool isLoaded;
  const ListCategoryLoaded(
      {required this.movieListModel, required this.isLoaded});

  @override
  List<Object> get props => [movieListModel];
}

class CategoryInitial extends CategoryState {}
