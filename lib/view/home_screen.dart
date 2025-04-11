import 'package:cx_app/resources/components/amount_input_dialog.dart';
import 'package:cx_app/resources/components/bottom_nav_bar.dart';
import 'package:cx_app/resources/components/currency_tile.dart';
import 'package:cx_app/utils/currency_util.dart';
import 'package:cx_app/view/add_currency_screen.dart';
import 'package:cx_app/view_model/CustomCurrency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Function to show keyboard and update amount
  void showAmountInputDialog(BuildContext context, String currencyCode) {
    TextEditingController controller = TextEditingController();
    final currencyProvider = Provider.of<CurrencyProvider>(
      context,
      listen: false,
    );
    showDialog(
      context: context,
      builder: (context) {
        return AmountInputDialog(
          currencyCode: currencyCode,
          onAmountSubmit: (enteredAmount) {
            currencyProvider.updateAmount(currencyCode, enteredAmount);
            currencyProvider.updateData(currencyCode, enteredAmount);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(exchangeRate);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        //add Button
        leading: IconButton(
          onPressed: () {
            CurrencyScreen.showDialogBox(context, (currencyCode) {
              Provider.of<CurrencyProvider>(
                context,
                listen: false,
              ).addCurrency(currencyCode);
              //for Shared Pref
              Provider.of<CurrencyProvider>(
                context,
                listen: false,
              ).addData(currencyCode);
              //fetching exchange rate based on selected list tile/ currencey.
              Provider.of<CurrencyProvider>(
                context,
                listen: false,
              ).fetchExchangeRates(currencyCode);
            });
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<CurrencyProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                provider.selectedCurrency.isNotEmpty
                    ? Expanded(
                      child: ListView.builder(
                        itemCount: provider.selectedCurrency.length,
                        itemBuilder: (context, index) {
                          String currencyCode =
                              provider.selectedCurrency[index];
                          var currencyDetails =
                              CurrencyUtils.getCurrencyDetails(currencyCode);
                          String? currencyName =
                              currencyDetails?['name'] ?? 'Unknown';
                          String? currencySymbol =
                              currencyDetails?['symbol'] ?? 'Unknown';
                          double? amount = provider.amounts[currencyCode] ?? 0;
                          // print(amount);
                          //calculating equivalent amount for other currencies
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CurrencyTile(
                              index: index,
                              context: context,
                              currencyCode: currencyCode,
                              currencyName: currencyName,
                              currencySymbol: currencySymbol,
                              amount: amount,
                              onTap: () {
                                showAmountInputDialog(context, currencyCode);
                              },
                            ),
                          );
                        },
                      ),
                    )
                    : Center(
                      child: Text(
                        'Add Currencey',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
