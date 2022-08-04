import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class GetCurrencyService {
  static Future getCurrency() async {
    try {
      Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      if (res.statusCode == HttpStatus.ok) {
        return res.data;
      } else {
        return "userE";
      }
    } catch (e) {
      if (e is SocketException){
        return "no";
      }
      throw Exception(e);
    }
  }
}
