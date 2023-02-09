part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<HomeCubit>()
        .scrollController
        .addListener(context.read<HomeCubit>().onScroll);
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('F L M'),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: Icon(Ionicons.ellipsis_vertical_outline))
        //   ],
        // ),
        body: RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refreshIndicator(),
      child: ListView(
        controller: context.read<HomeCubit>().scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          _search(context),
          _content(),
          const SizedBox(height: 28),
        ],
      ),
    ));
  }

  Widget _search(BuildContext context) {
    return BlocBuilder<UtilsCubit, UtilsState>(
      builder: (context, state) {
        return Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          decoration: !(context.read<DarkModeCubit>().prefsIsDarkMode ?? true)
              ? inputBoxDecorationRoundedLight
              : inputBoxDecorationRoundedDark,
          child: TextField(
              controller:
                  context.read<UtilsCubit>().searchTextEditingController,
              textInputAction: TextInputAction.search,
              decoration: !(context.read<UtilsCubit>().prefsIsDarkMode ?? false)
                  ? inputInputDecorationRoundedLigh.copyWith(
                      isDense: true,
                      hintText: 'Search',
                      prefixIcon:
                          const Icon(Ionicons.search, color: Colors.grey),
                      suffixIcon: (state is IsSarch)
                          ? (state.isSarch)
                              ? IconButton(
                                  onPressed: () {
                                    context.read<HomeCubit>().clearData();
                                    context.read<HomeCubit>().fecthListMovie();

                                    context
                                        .read<UtilsCubit>()
                                        .onTapSearch(false);
                                  },
                                  icon: const Icon(Ionicons.close,
                                      color: Colors.grey))
                              : null
                          : null)
                  : inputInputDecorationRoundedDark.copyWith(
                      isDense: true,
                      hintText: 'Search',
                      prefixIcon:
                          const Icon(Ionicons.search, color: Colors.grey),
                      suffixIcon: (state is IsSarch)
                          ? (state.isSarch)
                              ? IconButton(
                                  onPressed: () {
                                    context.read<HomeCubit>().clearData();
                                    context.read<HomeCubit>().fecthListMovie();

                                    context
                                        .read<UtilsCubit>()
                                        .onTapSearch(false);
                                  },
                                  icon: const Icon(Ionicons.close,
                                      color: Colors.grey))
                              : null
                          : null),
              onSubmitted: (value) {
                context.read<HomeCubit>().clearData();
                context.read<HomeCubit>().onScrollSearchQuery = value;

                context.read<HomeCubit>().searchListMovie();

                context.read<UtilsCubit>().onTapSearch(true);
              }),
        );
      },
    );
  }

  BlocBuilder<HomeCubit, HomeState> _content() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ListMovieLoaded) {
          if (!state.isLoaded) {
            List<MovieListModel> movieListModel = state.movieListModel;
            if (movieListModel.isNotEmpty) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(6),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, childAspectRatio: 2 / 2.8),
                  itemCount: movieListModel.length,
                  itemBuilder: (context, index) =>
                      CardMovie(movieListModel: movieListModel[index]));
            } else {
              return Center(
                  child: SizedBox(
                height: 260,
                width: 260,
                child: FlareActor(Assets.rive.emptyNotFound404,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    animation: 'idle'),
              ));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
