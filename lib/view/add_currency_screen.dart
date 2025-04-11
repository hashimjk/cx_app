import 'package:country_flags/country_flags.dart';
import 'package:cx_app/data/response/status.dart';
import 'package:cx_app/resources/colors.dart';
import 'package:cx_app/utils/utils.dart';
import 'package:cx_app/view_model/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen {
  static void showDialogBox(
    BuildContext context,
    Function(String) onCurrencySelected,
  ) {
    addCurrencyDialogBox(context, onCurrencySelected);
  }
}

Future<dynamic> addCurrencyDialogBox(
  BuildContext context,
  Function(String) onCurrencySelected,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<CurrencyViewModel>(
        builder: (context, value, _) {
          if (value.currencyList.status == Status.loading) {
            //While Loading
            return AlertDialog(title: Center(child: Text('Loading...')));
          } else if (value.currencyList.status == Status.error) {
            //On Error
            final errorMessage = value.currencyList.message.toString();
            return AlertDialog(title: Center(child: Text(errorMessage)));
          } else if (value.currencyList.status == Status.completed) {
            //print(value.currencyList.data!.conversionRates!.rates);
            var conversionRates =
                value.currencyList.data!.conversionRates!.rates;
            //Heading
            return AlertDialog(
              title: Center(child: Text('Select Currency')),
              content: SizedBox(
                width: 900,
                child: ListView.builder(
                  itemCount: conversionRates.length,
                  itemBuilder: (context, index) {
                    String currencyCode = conversionRates.keys.elementAt(index);
                    //double? rate = conversionRates[currencyCode];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),

                      //List of currencies
                      child: ListTile(
                        //On Tile Clicked
                        onTap: () {
                          onCurrencySelected(currencyCode);
                          Navigator.pop(context);
                        },
                        tileColor: Appcolors.lighBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: CountryFlag.fromCountryCode(
                          shape: Circle(),
                          Utils.getFlagCode(currencyCode),
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
