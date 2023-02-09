part of 'extensions.dart';

String formatLacale({required String key}) {
  late String result;
  switch (key) {
    case 'en':
      result = 'English';
      break;
    case 'id':
      result = 'Bahasa indonesia';
      break;
    case 'it':
      result = 'Italiano';
      break;
    case 'jv':
      result = 'Javanese';
      break;
    case 'ja':
      result = '日本語';
      break;
    case 'ko':
      result = '한국어/조선말';
      break;
    case 'la':
      result = 'Latin';
      break;
    case 'ms':
      result = 'Bahasa melayu';
      break;
    case 'ru':
      result = 'Pусский';
      break;
    case 'es':
      result = 'Español';
      break;
    case 'sv':
      result = 'svenska';
      break;
    case 'zh':
      result = '普通话';
      break;
    case 'ar':
      result = 'العربية';
      break;
    default:
      result = key;
  }

  return result;
}
