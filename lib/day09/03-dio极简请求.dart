import 'package:dio/dio.dart';

void main(List<String> arguments) async {
  try {
    Response response = await Dio().get(
        "https://www.fastmock.site/mock/432a14676095fee4c04836707d74972f/api/api/hello");
    print(
        'dio打印:$response'); //dio打印:{"code":1,"data":{"message":"hello HttpClient"}}
  } catch (e) {
    print(e);
  }
}
