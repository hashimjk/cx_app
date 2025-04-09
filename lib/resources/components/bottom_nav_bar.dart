import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        border: Border(top: BorderSide(color: Colors.black26)),
      ),
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.refresh, size: 28),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Last Update',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: [
                      Text(
                        //shows current time
                        DateFormat('hh:mm').format(DateTime.now()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        //shows current date and month
                        DateFormat(' MMMM dd').format(DateTime.now()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
