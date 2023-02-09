part of '../pages.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UtilsCubit>().generateScreenHiddenDrawer();
    return BlocBuilder<DarkModeCubit, DarkModeState>(
      builder: (context, utilsState) {
        return HiddenDrawerMenu(
          elevationAppBar: 4,
          backgroundColorMenu: colorPrimary,
          backgroundColorContent: (utilsState is ThemeBrightness)
              ? utilsState.isDrakMode
                  ? Colors.grey.shade900
                  : Colors.white
              : MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.white,
          initPositionSelected: 0,
          slidePercent: 60,
          screens: context.watch<UtilsCubit>().page,
        );
      },
    );
  }
}
