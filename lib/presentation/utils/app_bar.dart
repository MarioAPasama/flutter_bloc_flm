part of 'utils.dart';

Container appBar(BuildContext context, {bool borderRadius = true}) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    decoration: BoxDecoration(
      color: colorPrimary,
      borderRadius: (borderRadius)
          ? const BorderRadius.vertical(bottom: Radius.circular(16))
          : BorderRadius.zero,
      boxShadow: const [
        BoxShadow(blurRadius: 4),
      ],
    ),
  );
}

AppBar appBarDefault(BuildContext context,
    {required String title, bool? centerTitle, List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    actions: actions,
  );
}
