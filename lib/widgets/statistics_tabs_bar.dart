import 'package:flutter/material.dart';

class DayTabsBar extends StatefulWidget {
  DayTabsBar({required this.onTabsChanged});

  final Function onTabsChanged;

  _DayTabsBarState createState() => _DayTabsBarState(onTabsChanged);
}

class _DayTabsBarState extends State<DayTabsBar> {
  _DayTabsBarState(this.onTabChanged);

  final Function onTabChanged;
  static var selectedIndex = 1;

  Widget build(BuildContext context) {
    Widget createTab(String title, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            onTabChanged(index);
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: 40.0,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 80),
            style: TextStyle(
                color: (selectedIndex == index) ? Colors.white : Colors.white60,
                fontFamily: "MazzardH-SemiBold",
                fontSize: 15.0),
            child: Text(
              title,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        createTab("Total", 0),
        createTab("Today", 1),
        createTab("Yesterday", 2)
      ],
    );
  }
}
