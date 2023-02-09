part of 'utils.dart';

class CardMovie extends StatelessWidget {
  final MovieListModel movieListModel;
  const CardMovie({required this.movieListModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(RouteNamed.detail, queryParams: {
        'id': movieListModel.id,
        'title': movieListModel.title,
        'dateRelease': movieListModel.dateRelease,
        'posterPath': movieListModel.posterPath,
      }),
      child: CachedNetworkImage(
        imageUrl: MainService().imageBaseUrl +
            MainService().imageRestW780 +
            movieListModel.posterPath,
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        placeholder: (context, url) {
          return Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(14)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            margin: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(14)),
            child: const Icon(
              Ionicons.cloud_offline_outline,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}
