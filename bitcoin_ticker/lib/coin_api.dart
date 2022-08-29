import 'dart:convert';
import 'package:http/http.dart' as http;

String apiKey = "CAAA9CCF-57EB-4391-B31A-C9B73B7BCD4C";
// UserLocation locationClass = UserLocation();

class CoinNetworkingData {
  Future coinApi(String coinName, String currency) async {
    var decodeData;
    String postsURL =
        'https://rest.coinapi.io/v1/exchangerate/$coinName/$currency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(postsURL));
    if (response.statusCode == 200) {
      String data = response.body;
      decodeData = jsonDecode(data);
    } else {
      print(response);
    }
    return decodeData;
  }
}
