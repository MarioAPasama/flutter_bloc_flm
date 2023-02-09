part of 'theme.dart';

InputDecoration inputInputDecorationRoundedLigh = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(10.0),
  ),
  // filled: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
  // hintStyle: const TextStyle(color: Colors.black),
  fillColor: Colors.white70,
);

InputDecoration inputInputDecorationRoundedDark = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(10.0),
  ),
  // filled: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
  // hintStyle: const TextStyle(color: Colors.grey),
  fillColor: Colors.white70,
);

BoxDecoration inputBoxDecorationRoundedLight = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
);
BoxDecoration inputBoxDecorationRoundedDark = BoxDecoration(
  color: colorGrey,
  borderRadius: BorderRadius.circular(10.0),
);
