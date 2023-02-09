part of '../pages.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DarkModeCubit>().initBrightnessMode(context);
    context.read<SplashScreenCubit>().navigationNextSplashScreen(context);

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xFF111111),
              image: DecorationImage(
                  image: AssetImage(Assets.images.splash.path))),
          child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
            builder: (context, state) {
              if (state is CheckConnectivity) {
                return (state.isConnectivityNon)
                    ? Container(
                        color: Colors.white.withOpacity(0.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Icon(
                              Ionicons.warning_outline,
                              size: 100,
                              color: Colors.redAccent.shade100,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'No Internet',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () =>
                                      context.read<UtilsCubit>().onTapExit(),
                                  icon: const Icon(
                                    Ionicons.log_out_outline,
                                    size: 40,
                                    color: Colors.grey,
                                  )),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                      )
                    : const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
