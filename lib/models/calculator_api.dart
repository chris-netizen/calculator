import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class CalculatorApi {
  final Uri currencyUrl = Uri.https(
      'api.apilayer.com',
      '/exchangerates_data/live?base=USD&symbols=EUR,GBP,NGN',
      {'apikey': 'I7PPTuYb6my5jPcoVNq3iRQ1zBGRlmLS'});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyUrl);

    if (res.statusCode == 200) {
      var body = convert.jsonDecode(res.body);
      var list = body['symbols'];
      List<String> currencies = (list.keys).toList();
      return currencies;
    } else {
      throw Exception('Failed to load currencies');
    }
  }
}
