import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

class GetCurrencyService {
  static Future getCurrency() async {
    try {
      Response response = await https.get(Uri.parse('https://nbu.uz/exchange-rates/json/'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body);
      } else {
        return "yourself_mistake";
      }
    } catch (e) {
      if (e is SocketException) {
        return 'no';
      }
      throw Exception(e);
    }
  }
}
