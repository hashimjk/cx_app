import 'package:cx_app/repository/custom_currency_repo.dart';
import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  Map<String, double> amounts = {};
  Map<String, double> exchangeRate = {};

  //to store the selected currency
  List<String> selectedCurrency = [];

  //add a new currency
  void addCurrency(String currency) {
    selectedCurrency.add(currency);
    notifyListeners();
  }

  // Update the amount for a currency
  void updateAmount(String currencyCode, double enteredAmount) async {
    //  print('Entered Amount $enteredAmount');
    amounts.clear();
    amounts[currencyCode] = enteredAmount;
    await fetchExchangeRates(currencyCode);
    // print('Updated Amounts for $currencyCode: $amounts');
    for (var entry in exchangeRate.entries) {
      if (entry.key != currencyCode) {
        amounts[entry.key] = enteredAmount * entry.value;
        //     print('Recalculating for ${entry.key}: ${amounts[entry.key]}');
      }
    }
    notifyListeners();
  }

  Future<void> fetchExchangeRates(String baseCurrency) async {
    try {
      final rates = await fetchExchangeRate(baseCurrency);

      exchangeRate = rates;
      // print('Fetched rates for $baseCurrency: $exchangeRate');
      notifyListeners();
    } catch (e) {
      print('Failed to fetch Exchange rates $e');
    }
  }
}
