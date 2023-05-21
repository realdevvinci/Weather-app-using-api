import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var url1 = Uri.parse(this.url);
    var response = await http.get(url1);

    if (response.statusCode == 200) {
      JsonDecoder decoder = JsonDecoder();

      var data = decoder.convert(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
