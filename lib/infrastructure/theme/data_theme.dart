part of 'theme.dart';

ThemeData themeDataDark() {
  return ThemeData.dark().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
    iconTheme: IconThemeData(color: colorWhite),
    backgroundColor: colorBlack,
    dialogBackgroundColor: colorWhite.withOpacity(0.88),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: colorPrimary),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    ),
  );
}

ThemeData themeDataLight() {
  return ThemeData.light().copyWith(
    backgroundColor: colorWhite,
    colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
    iconTheme: IconThemeData(color: colorBlack),
    dialogBackgroundColor: colorWhite.withOpacity(0.88),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: colorPrimary),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    ),
  );
}
