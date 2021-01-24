import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url =
      'https://www.fastmock.site/mock/432a14676095fee4c04836707d74972f/api/api/hello';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['data']['message'];
    print('结果: $itemCount'); //hello HttpClient
  } else {
    print('${response.statusCode}.');
  }
}
