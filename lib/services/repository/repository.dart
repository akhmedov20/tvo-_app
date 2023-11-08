

import '../app_provider/appProvider.dart';
import '../httpResult/http_result.dart';

class Repository {
  final AppProvider _provider = AppProvider();
  Future<HttpResult> getTrendingList() => _provider.getTrending();
}