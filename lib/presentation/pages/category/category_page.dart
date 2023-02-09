part of '../pages.dart';

class CategoryPage extends StatelessWidget {
  final String idGenre;
  const CategoryPage({required this.idGenre, super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().initState();
    context.read<CategoryCubit>().idGenre = idGenre;
    context.read<CategoryCubit>().fecthListMovie();
    context
        .read<CategoryCubit>()
        .scrollController
        .addListener(context.read<CategoryCubit>().onScroll);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => context.read<CategoryCubit>().refreshIndicator(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          controller: context.read<CategoryCubit>().scrollController,
          children: [
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is ListCategoryLoaded) {
                  if (!state.isLoaded) {
                    List<MovieListModel> movieListModel = state.movieListModel;
                    if (movieListModel.isNotEmpty) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(6),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 2.8),
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
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
