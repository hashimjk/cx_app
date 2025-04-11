import 'package:flutter/material.dart';

class AmountInputDialog extends StatelessWidget {
  final String currencyCode;
  final Function(double) onAmountSubmit;

  const AmountInputDialog({
    super.key,
    required this.currencyCode,
    required this.onAmountSubmit,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text("Enter Amount for $currencyCode"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Amount'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            double enteredAmount = double.tryParse(controller.text) ?? 0;
            if (enteredAmount > 0) {
              onAmountSubmit(enteredAmount);
              Navigator.pop(context);
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
