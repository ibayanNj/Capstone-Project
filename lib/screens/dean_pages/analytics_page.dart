import 'package:flutter/material.dart';

class DeanAnalyticsPage extends StatelessWidget {
  const DeanAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text('Analytics Page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}