import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
    BottomNavigationBarItem(icon: SizedBox(), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Statistics"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];
}
