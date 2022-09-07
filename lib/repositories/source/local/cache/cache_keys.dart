import 'cache_helper.dart';

class CacheKeysManger {
  static String getLanguageFromCache() =>
      CacheHelper.getData(key: 'lang') ?? 'ar';
}
