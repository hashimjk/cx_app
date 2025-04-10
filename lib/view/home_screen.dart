import 'package:cx_app/resources/colors.dart';
import 'package:cx_app/resources/components/bottom_nav_bar.dart';
import 'package:cx_app/view/add_currency_screen.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final flagsUk = CountryFlag.fromCountryCode(
    "GB",
    shape: RoundedRectangle(1),
    height: 30,
    width: 45,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        //add Button
        leading: IconButton(
          onPressed: () {
            AddCurrencyScreen().showDialogBox(context);
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              tileColor: Colors.white,
              trailing: Column(
                children: [
                  Text("10.00\$", style: TextStyle(fontSize: 19)),
                  Text("United States Dollar", style: TextStyle(fontSize: 10)),
                ],
              ),
              leading: flagsUk,
              title: Text('GBP'),
            ),

            // Center(
            //   child: Text(
            //     'List Tiles here',
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
