part of 'pages.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SaveMovieCubit>().initState();

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: PageView(
            children: [_page[state.page]],
          )),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) =>
                context.read<NavigationCubit>().navigationPage(value),
            currentIndex: state.page,
            iconSize: 22,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.home_outline), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.albums_outline), label: 'WHISLIST'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.settings_outline), label: 'SETTINGS'),
            ],
          ),
        );
      },
    );
  }

  final List _page = [
    // const HomePage(),
    const DrawerPage(),
    const WhislistPage(),
    const SettingsPage(),
  ];
}
