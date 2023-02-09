import 'dart:developer';

import 'package:application_flm/cubit/cubit.dart';
import 'package:application_flm/infrastructure/routes/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  late bool isConnectivityNon = false;

  void navigationNextSplashScreen(BuildContext context) async {
    // do {
    //   await checkConnection();
    // } while (isConnectivity == false);
    await checkConnection();
    if (!isConnectivityNon) {
      do {
        Future.delayed(const Duration(seconds: 4), () {
          if (context.read<UtilsCubit>().genreListModel != []) {
            context.goNamed(RouteNamed.mian);
            // context.goNamed(RouteNamed.drawer);
          }
        });
      } while (context.read<UtilsCubit>().genreListModel == []);
    }
  }

  Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      log('isConnectivityNon true');
      isConnectivityNon = true;
    }

    emit(CheckConnectivity(isConnectivityNon: isConnectivityNon));
  }
}
