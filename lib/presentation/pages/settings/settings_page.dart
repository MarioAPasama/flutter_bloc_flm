part of '../pages.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(
              28, MediaQuery.of(context).padding.top + 52, 28, 16),
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            _listSetting(
                icon: const Icon(Ionicons.moon_outline),
                title: 'Dark Mode',
                child: BlocBuilder<DarkModeCubit, DarkModeState>(
                  builder: (context, state) {
                    return Switch(
                      value: (state is ThemeBrightness)
                          ? state.isDrakMode
                          : MediaQuery.of(context).platformBrightness ==
                              Brightness.dark,
                      activeColor: colorPrimary,
                      onChanged: (value) => context
                          .read<DarkModeCubit>()
                          .changeBrightnessMode(context, value: value),
                    );
                  },
                )),
            _listSetting(
                icon: const Icon(Ionicons.terminal_outline),
                title: 'App Version',
                child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) => Text(
                          (state is AppVersion) ? state.appVersion : '0.0.0'),
                    ))),
            _listSetting(
              onTap: () => context.read<UtilsCubit>().urlLauncher(
                  url:
                      'mailto:work.riopasama@gmail.com?subject=NvinixProjectFLM',
                  runExternalApplication: true),
              icon: const Icon(Ionicons.chatbubble_outline),
              title: 'Contact',
            ),
            _listSetting(
              icon: const Icon(Ionicons.book_outline),
              title: 'Terms & Conditions',
            ),
            _listSetting(
              icon: const Icon(Ionicons.lock_closed_outline),
              title: 'Privacy policy',
            ),
            _listSetting(
              onTap: () => context.read<UtilsCubit>().urlLauncher(
                  url:
                      'https://play.google.com/store/apps/details?id=com.nvinix.flm',
                  runExternalApplication: true),
              icon: const Icon(Ionicons.star_outline),
              title: 'Rating',
            ),
            _listSetting(
              onTap: () => context.read<UtilsCubit>().onTapExit(),
              icon: const Icon(Ionicons.log_out_outline),
              title: 'Exit',
            ),
          ],
        ),
        appBar(context),
      ],
    );
  }

  GestureDetector _listSetting(
      {void Function()? onTap,
      required Icon icon,
      required String title,
      Widget? child}) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        color: Colors.transparent,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(title),
            const Spacer(),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
