part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class ListDetailMovieLoaded extends DetailState {
  final MovieDetailModel movieDetailModel;
  final List<CreditListModel> creditListModel;
  final bool isLoaded;
  const ListDetailMovieLoaded(
      {required this.movieDetailModel,
      required this.creditListModel,
      required this.isLoaded});

  @override
  List<Object> get props => [movieDetailModel, creditListModel];
}

class DetailInitial extends DetailState {}
