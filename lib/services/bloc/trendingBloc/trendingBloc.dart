import 'package:rxdart/rxdart.dart';
import 'package:tvoyo/models/trendingMovies/trendingMovies_model.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TrendingBloc{
  final Repository _repository = Repository();
  final _fetchTrending = PublishSubject<TrendingMoviesModel>();
  Stream<TrendingMoviesModel> get getTrendingMovies => _fetchTrending.stream;

  getTrending() async{
    HttpResult response = await _repository.getTrendingList();
    if(response.isSuccess){
      var data = TrendingMoviesModel.fromJson(response.result);
      _fetchTrending.sink.add(data);
    }
  }
}
final trendingBloc = TrendingBloc();