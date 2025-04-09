import 'package:cx_app/resources/colors.dart';
import 'package:cx_app/resources/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        //add Button
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        actions: [
          IconButton(icon: Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'List Tiles here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
