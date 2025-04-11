import 'dart:convert';
import 'dart:io';

import 'package:cx_app/data/app_exceptions.dart';
import 'package:cx_app/resources/components/url.dart';
import 'package:http/http.dart' as http;

Future fetchExchangeRate(String baseCurrency) async {
  try {
    final response = await http.get(
      Uri.parse(AppUrl.customCurrenceyUrl + baseCurrency),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final conversionRate = data['conversion_rates'] as Map<String, dynamic>;
      return conversionRate.map(
        (key, value) => MapEntry(key, value is num ? value.toDouble() : 0.0),
      );
    } else {
      throw FetchDataException('Failed to Fetch Data');
    }
  } on SocketException {
    throw FetchDataException('No Internet Connection');
  }
}
