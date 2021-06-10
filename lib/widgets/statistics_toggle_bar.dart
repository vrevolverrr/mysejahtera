import 'package:flutter/material.dart';

class ToggleBar extends StatefulWidget {
  ToggleBar({required this.onTabChanged});

  final Function onTabChanged;

  _ToggleBarState createState() => _ToggleBarState(onTabChanged);
}

class _ToggleBarState extends State<ToggleBar> {
  _ToggleBarState(this.onTabChanged);

  final Function onTabChanged;
  static var selectedIndex = 0;

  Widget build(BuildContext context) {
    return Container(
      width: 330.0,
      height: 44.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(30.0)),
      child: Stack(
        children: <Widget>[
          AnimatedAlign(
            duration: Duration(milliseconds: 220),
            curve: Curves.fastOutSlowIn,
            alignment: (selectedIndex == 0)
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(4.0, 1.0, 4.0, 1.0),
              width: 165.0,
              height: 38.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                      onTabChanged(selectedIndex);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 140.0,
                    height: 40.0,
                    child: Transform.translate(
                      offset: Offset(0.0, 1.0),
                      child: Text(
                        "Country",
                        style: TextStyle(
                            color: (selectedIndex == 0)
                                ? Color(0xff2c5ce6)
                                : Color(0xff4f4f4f),
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                      onTabChanged(selectedIndex);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 140.0,
                    height: 40.0,
                    child: Transform.translate(
                      offset: Offset(-4.0, 1.0),
                      child: Text(
                        "Global",
                        style: TextStyle(
                            color: (selectedIndex == 1)
                                ? Color(0xff2c5ce6)
                                : Color(0xff4f4f4f),
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
