part of '../pages.dart';

class WhislistPage extends StatelessWidget {
  const WhislistPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WhislistCubit>().initState();
    return Stack(
      children: [
        appBar(context),
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _content(),
            const SizedBox(height: 28),
          ],
        ),
      ],
    );
  }

  BlocBuilder<WhislistCubit, WhislistState> _content() {
    return BlocBuilder<WhislistCubit, WhislistState>(
      builder: (context, state) {
        if (state is ListMovieWhislistLoaded) {
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
      },
    );
  }
}
