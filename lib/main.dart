import 'package:application_flm/cubit/cubit.dart';
import 'package:application_flm/infrastructure/extensions/extensions.dart';
import 'package:application_flm/infrastructure/routes/routes.dart';
import 'package:application_flm/infrastructure/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit()..initState()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => UtilsCubit()..initState()),
        BlocProvider(create: (context) => HomeCubit()..initState()),
        BlocProvider(create: (context) => WhislistCubit()),
        BlocProvider(create: (context) => SettingsCubit()..initState()),
        BlocProvider(create: (context) => SplashScreenCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => DetailCubit()),
        BlocProvider(create: (context) => SaveMovieCubit()),
      ],
      child: BlocBuilder<DarkModeCubit, DarkModeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: themeDataLight(),
            darkTheme: themeDataDark(),
            scrollBehavior: MyCustomScrollBehavior(),
            themeMode:
                (state is ThemeBrightness) ? state.themeMode : ThemeMode.system,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
