import 'package:cx_app/data/response/api_response.dart';
import 'package:cx_app/models/currency_model.dart';
import 'package:cx_app/repository/currencey_repo.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel extends ChangeNotifier {
  final _currencyRepo = CurrenceyRepo();
  ApiResponse<CurrencyModel> currencyList = ApiResponse.loading();
  setCurrencyList(ApiResponse<CurrencyModel> response) {
    currencyList = response;
    notifyListeners();
  }

  Future<void> fetchCurrencyData() async {
    setCurrencyList(ApiResponse.loading());
    try {
      _currencyRepo
          .getCurrency()
          .then((val) {
            if (val != null) {
              setCurrencyList(ApiResponse.completed(val));
            } else {
              setCurrencyList(ApiResponse.error("Failed to fetch data"));
            }
          })
          .onError((err, stacktrace) {
            setCurrencyList(ApiResponse.error(err.toString()));
          });
    } catch (e) {
      rethrow;
    }
  }
}
