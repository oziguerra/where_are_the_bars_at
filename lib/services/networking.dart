import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    print('Getting response...');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print('200');
      String data = response.body;
      var decodedData = jsonDecode(data);
      //print(decodedData);
      return decodedData;
    } else {
      print(response.statusCode.toString());
    }
  }
}
