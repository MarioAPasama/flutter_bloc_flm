import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial(0));

  void navigationPage(int page) {
    final updateState = NavigationInitial(page);
    emit(updateState);
  }
}
