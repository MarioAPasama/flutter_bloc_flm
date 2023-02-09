part of 'routes.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routerNeglect: true,
  initialLocation: RouteNamed.splashScreen,
  routes: [
    GoRoute(
      name: RouteNamed.splashScreen,
      path: '/splash-screen',
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      name: RouteNamed.drawer,
      path: '/drawer',
      builder: (context, state) => const DrawerPage(),
    ),
    GoRoute(
        name: RouteNamed.mian,
        path: '/main',
        builder: (context, state) => MainPage(),
        routes: [
          GoRoute(
            name: RouteNamed.home,
            path: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: RouteNamed.whislist,
            path: 'whislist',
            builder: (context, state) => const WhislistPage(),
          ),
          GoRoute(
            name: RouteNamed.settings,
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            name: RouteNamed.detail,
            path: 'detail',
            builder: (context, state) => DetailPage(
              movieListModel: MovieListModel(
                  id: state.queryParams['id'] ?? '',
                  title: state.queryParams['title'] ?? '',
                  dateRelease: state.queryParams['dateRelease'] ?? '',
                  posterPath: state.queryParams['posterPath'] ?? ''),
            ),
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: DetailPage(
                    movieListModel: MovieListModel(
                        id: state.queryParams['id'] ?? '',
                        title: state.queryParams['title'] ?? '',
                        dateRelease: state.queryParams['dateRelease'] ?? '',
                        posterPath: state.queryParams['posterPath'] ?? ''))),
          ),
        ]),
  ],
);
