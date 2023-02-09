part of 'splash_screen_cubit.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class CheckConnectivity extends SplashScreenState {
  final bool isConnectivityNon;
  const CheckConnectivity({required this.isConnectivityNon});

  @override
  List<Object> get props => [isConnectivityNon];
}

class SplashScreenInitial extends SplashScreenState {}
