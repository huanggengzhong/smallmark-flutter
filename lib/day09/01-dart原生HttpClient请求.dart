import 'dart:io';
import 'dart:convert';

main(List<String> args) async {
  // 1.创建HttpClient
  HttpClient client = new HttpClient();
  //2.构建请求
  final request = await client.getUrl(Uri.parse(
      "https://www.fastmock.site/mock/432a14676095fee4c04836707d74972f/api/api/hello"));

// 发送请求
  final response = await request.close();

  if (response.statusCode == HttpStatus.ok) {
    // 手动解码
    final res = await response.transform(utf8.decoder).join();
    print('结果:$res'); //成功打印:结果:{"code":1,"data":{"message":"hello HttpClient"}}
  } else {
    print(response.statusCode);
  }
}
