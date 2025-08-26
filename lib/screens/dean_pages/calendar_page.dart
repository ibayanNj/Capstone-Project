import 'package:flutter/material.dart';

class DeanCalendarPage extends StatelessWidget {
  const DeanCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text('Academic Calendar Page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}