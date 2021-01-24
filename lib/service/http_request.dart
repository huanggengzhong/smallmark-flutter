import 'package:dio/dio.dart';

import 'config.dart';

class HttpRequest {
// 创建基本配置
  static final BaseOptions options = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeOut);
// 创建dio
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'get', Map<String, dynamic> params}) async {
    //1.创建单独配置
    final option = Options(method: method);

    //2.发送网络请求,同时增加dio异常捕捉
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: option);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
