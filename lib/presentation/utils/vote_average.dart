part of 'utils.dart';

class VoteAverage extends StatelessWidget {
  final double voteAverage;
  const VoteAverage({required this.voteAverage, super.key});

  @override
  Widget build(BuildContext context) {
    int starVoteAverage = voteAverage ~/ 2;
    int halfrVoteAverage =
        int.parse(voteAverage.toStringAsFixed(1).split('.').last);

    List<Widget> star = List.generate(
        5,
        (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                (index < starVoteAverage)
                    ? Ionicons.star
                    : Ionicons.star_outline,
                color: Colors.amber,
              ),
            ));

    if (int.parse(voteAverage.toStringAsFixed(0)) % 2 == 0 &&
        halfrVoteAverage >= 5) {
      star.removeAt(starVoteAverage);
      star.insertAll(starVoteAverage, const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Ionicons.star_half_outline,
            color: Colors.amber,
          ),
        )
      ]);
    }
    star.add(const SizedBox(width: 6));
    star.add(SizedBox(
      height: 14,
      child: Text('${voteAverage.toStringAsFixed(1)}/10'),
    ));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: star);
  }
}
