part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  final int page;
  const NavigationState(this.page);

  @override
  List<Object> get props => [page];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial(super.page);
}
