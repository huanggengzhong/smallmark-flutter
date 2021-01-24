import 'service/http_request.dart';

void main(List<String> arguments) async {
  HttpRequest.request('/get', params: {"name": 'why'}).then((res) {
    print('封装请求打印结果:$res');
  });
}
