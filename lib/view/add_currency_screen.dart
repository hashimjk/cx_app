import 'package:country_flags/country_flags.dart';
import 'package:cx_app/data/response/status.dart';
import 'package:cx_app/resources/colors.dart';
import 'package:cx_app/view_model/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCurrencyScreen extends StatelessWidget {
  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<CurrencyViewModel>(
          builder: (context, value, _) {
            if (value.currencyList.status == Status.loading) {
              return AlertDialog(title: Center(child: Text('Loading...')));
            } else if (value.currencyList.status == Status.error) {
              final errorMessage = value.currencyList.message.toString();
              return AlertDialog(title: Center(child: Text(errorMessage)));
            } else if (value.currencyList.status == Status.completed) {
              var conversionRates =
                  value.currencyList.data!.conversionRates!.rates;
              return AlertDialog(
                title: Center(child: Text('Select Currency')),
                content: SizedBox(
                  width: 900,
                  child: ListView.builder(
                    itemCount: conversionRates.length,
                    itemBuilder: (context, index) {
                      String currencyCode = conversionRates.keys.elementAt(
                        index,
                      );
                      double? rate = conversionRates[currencyCode];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Appcolors.lighBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          leading: CountryFlag.fromCountryCode(
                            shape: Circle(),
                            getFlagCode(currencyCode),
                          ),
                          title: Text(currencyCode),
                          // subtitle: Text(rate.toString()),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return SizedBox();
          },
        );
      },
    );
  }

  String getFlagCode(String currencyCode) {
    return currencyCode.substring(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
