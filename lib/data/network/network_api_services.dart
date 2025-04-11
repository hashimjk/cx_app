import 'dart:convert';
import 'dart:io';

import 'package:cx_app/data/app_exceptions.dart';
import 'package:cx_app/data/network/base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiServices(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body);
    case 401:
      return BadRequestException(response.body.toString());
    default:
      throw FetchDataException(
        'Error Occured while communicating with Server with Exception ${response.statusCode.toString()}',
      );
  }
}
