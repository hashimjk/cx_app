import 'package:cx_app/view_model/CustomCurrency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:provider/provider.dart';

class CurrencyTile extends StatelessWidget {
  final int index;
  final BuildContext context;
  final String currencyCode;
  final String currencySymbol;
  final String currencyName;
  final double amount;
  final VoidCallback onTap;

  const CurrencyTile({
    super.key,
    required this.index,
    required this.context,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyName,
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(currencyCode),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(Icons.delete_outline, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CurrencyProvider>(context).removeCurrency(currencyCode);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$currencyCode removed')));
      },
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        trailing: Column(
          children: [
            Text(
              '$currencySymbol${amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
        leading: CountryFlag.fromCountryCode(
          currencyCode.substring(0, 2).toLowerCase(),
        ),
        title: Text(currencyName),
      ),
    );
  }
}
