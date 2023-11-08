class HttpResult{
  int statusCode;
  dynamic result;
  bool isSuccess;

  HttpResult({
    required this.statusCode,
    required this.isSuccess,
    required this.result
  });
}