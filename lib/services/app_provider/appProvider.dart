import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../httpResult/http_result.dart';

class AppProvider {
  static Duration duration = const Duration(seconds: 30);
  final String _baseUrl = "https://api.themoviedb.org/";
  getRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDI5ZGE0ZDVmMmNiNTA3NGRkOTA5NzlkMjIzNWNjZCIsInN1YiI6IjYzNGZlZGM5YmU0YjM2MDA4NGU0OGNjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ip8Nk-uIKu4Wfz4mFFFd1ohboe_s9Fd6OGlH6B0Nstk",
          "Content-Type": "application/json"
        },).timeout(duration);
      return _result(response);
    } on TimeoutException catch(e){
      print(e.message);
      return HttpResult(
          statusCode: -1,
          isSuccess: false,
          result: "Интернет не работает"
      );
    } on SocketException catch(_){
      return HttpResult(
          statusCode: -1,
          isSuccess: false,
          result: "Интернет не работает");
    }

  }

  HttpResult _result (http.Response response){
    print(response.body);
    print(response.statusCode);
    if(response.statusCode >= 200 && response.statusCode <300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    }
    else{
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: response.body,
      );
    }
  }

  Future<HttpResult> getTrending()async{
    String url = "https://api.themoviedb.org/3/trending/movie/week?language=ru-RUS";
    return await getRequest(url);
  }
}