part of '../pages.dart';

class DetailPage extends StatelessWidget {
  final MovieListModel movieListModel;
  const DetailPage({required this.movieListModel, super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DetailCubit>().initState();
    context.read<SaveMovieCubit>().chackMovieIsSave(movieListModel);

    context.read<DetailCubit>().fecthDetailMovie(movieListModel.id);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            context.read<DetailCubit>().refreshIndicator(movieListModel.id),
        child: Stack(children: [
          appBar(context, borderRadius: false),
          SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<DetailCubit, DetailState>(
                  builder: (context, state) {
                    if (state is ListDetailMovieLoaded) {
                      if (!state.isLoaded) {
                        MovieDetailModel movieDetailModel =
                            state.movieDetailModel;
                        List<CreditListModel> creditListModel =
                            state.creditListModel;

                        return ListView(children: [
                          _headerCover(movieDetailModel),
                          const SizedBox(height: 18),
                          _headerTitle(movieDetailModel),
                          _castAndCrew(creditListModel),
                          _stroyline(movieDetailModel),
                          const SizedBox(height: 80),
                        ]);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 26, bottom: 26),
              child: ElevatedButton(
                  onPressed: () => context
                      .read<SaveMovieCubit>()
                      .onTapSaveMovie(movieListModel),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: BlocBuilder<SaveMovieCubit, SaveMovieState>(
                    builder: (context, state) {
                      if (state is SaveMovie) {
                        if (state.isSave) {
                          return const Icon(Ionicons.bookmark,
                              color: Colors.white);
                        } else {
                          return const Icon(Ionicons.bookmark_outline,
                              color: Colors.white);
                        }
                      } else {
                        return const SizedBox();
                      }
                    },
                  )),
            ),
          )
        ]),
      ),
    );
  }

  Widget _castAndCrew(List<CreditListModel> creditListModel) {
    return Visibility(
      visible: creditListModel.isNotEmpty,
      child: Container(
        margin: const EdgeInsets.only(top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 10),
              child: Text(
                'Cast & Crew',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 94,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemCount: creditListModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: MainService().imageBaseUrl +
                              MainService().imageRestW300 +
                              creditListModel[index].profilePath,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 60,
                              width: 60,
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            );
                          },
                          placeholder: (context, url) {
                            return Container(
                              height: 60,
                              width: 60,
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Ionicons.cloud_offline_outline,
                              ),
                            );
                          },
                        ),
                        Text(
                          creditListModel[index].name,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _stroyline(MovieDetailModel movieDetailModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stroyline',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(movieDetailModel.overview)
        ],
      ),
    );
  }

  Padding _headerTitle(MovieDetailModel movieDetailModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            movieDetailModel.originalTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 20,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieDetailModel.genres.length,
              itemBuilder: (context, index) {
                if (index < movieDetailModel.genres.length - 1) {
                  return Text('${movieDetailModel.genres[index].name}, ');
                } else {
                  return Text(
                      '${movieDetailModel.genres[index].name} - ${formatLacale(key: movieDetailModel.originalLanguage)}');
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          VoteAverage(voteAverage: movieDetailModel.voteAverage),
          Container()
        ],
      ),
    );
  }

  AspectRatio _headerCover(MovieDetailModel movieDetailModel) {
    late String imageRest = MainService().imageRestOriginal;
    // if (Platform.isAndroid) {
    //   imageRest = MainService().imageRestW780;
    // } else if (Platform.isFuchsia) {
    //   imageRest = MainService().imageRestW780;
    // } else if (Platform.isIOS) {
    //   imageRest = MainService().imageRestW780;
    // } else if (Platform.isLinux) {
    //   imageRest = MainService().imageRestOriginal;
    // } else if (Platform.isMacOS) {
    //   imageRest = MainService().imageRestOriginal;
    // } else if (Platform.isWindows) {
    //   imageRest = MainService().imageRestOriginal;
    // } else {
    //   imageRest = MainService().imageRestOriginal;
    // }

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: CachedNetworkImage(
        imageUrl: MainService().imageBaseUrl +
            imageRest +
            movieDetailModel.backdropPath,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      colorGrey,
                    ],
                  )),
                  child: const BackButton(color: Colors.white)),
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(color: Colors.grey),
            child: const BackButton(color: Colors.white),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: const BoxDecoration(color: Colors.grey),
            child: Stack(children: const [
              Center(
                child: Icon(
                  Ionicons.cloud_offline_outline,
                  size: 50,
                ),
              ),
              BackButton(color: Colors.white)
            ]),
          );
        },
      ),
    );
  }
}
