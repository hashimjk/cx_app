import 'dart:convert';

import 'package:cx_app/repository/custom_currency_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyProvider extends ChangeNotifier {
  Map<String, double> amounts = {};
  Map<String, double> exchangeRate = {};

  CurrencyProvider() {
    load();
  }
  //to store the selected currency
  List<String> selectedCurrency = [];

  //add a new currency
  void addCurrency(String currency) {
    selectedCurrency.add(currency);
    notifyListeners();
  }

  //Loading data from sharedPrefernces
  Future<void> load() async {
    print('load');
    final prefs = await SharedPreferences.getInstance();
    final String? currencyData = prefs.getString('currencies');
    if (currencyData != null) {
      final Map<String, dynamic> data = jsonDecode(currencyData);
      selectedCurrency = List<String>.from(data['selectedCurrency']);
      amounts = Map<String, double>.from(data["amounts"]);
    }
    notifyListeners();
  }

  //  // Add currency
  void addData(String currencyCode) {
    if (!selectedCurrency.contains(currencyCode)) {
      selectedCurrency.add(currencyCode);
      amounts[currencyCode] = 0.0;
      saveData();
      notifyListeners();
    }
  }

  // Remove currency
  void removeCurrency(String currencyCode) {
    selectedCurrency.remove(currencyCode);
    amounts.remove(currencyCode);
    saveData();
    notifyListeners();
  }

  // Update amount for a currency
  void updateData(String currencyCode, double amount) {
    amounts[currencyCode] = amount;
    saveData();
    notifyListeners();
  }

  //Saving Data to Shared Preferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> data = {
      'selectedCurrency': selectedCurrency,
      'amounts': amounts,
    };
    print('Saving data: ${jsonEncode(data)}');
    prefs.setString('currencies', jsonEncode(data));
  }

  // Update the amount for a currency
  void updateAmount(String currencyCode, double enteredAmount) async {
    //  print('Entered Amount $enteredAmount');
    //amounts.clear();
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
      debugPrint('Failed to fetch Exchange rates $e');
    }
  }
}
