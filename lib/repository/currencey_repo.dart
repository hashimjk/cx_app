import 'package:cx_app/data/network/base_api_services.dart';
import 'package:cx_app/data/network/network_api_services.dart';
import 'package:cx_app/models/currency_model.dart';
import 'package:cx_app/resources/components/url.dart';

class CurrenceyRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CurrencyModel> getCurrency() async {
    try {
      final response = await _apiServices.getApiServices(
        AppUrl.mainCurrencyUrl,
      );
      return CurrencyModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
