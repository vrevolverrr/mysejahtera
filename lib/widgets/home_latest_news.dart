import 'package:flutter/material.dart';

class LatestNews extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Widget NewsItem(
      {required double height,
      required String timestamp,
      required RichText textWidget,
      required Image image}) {
    return Container(
      width: 360.0,
      height: height,
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                spreadRadius: 0.2,
                blurRadius: 5.0,
                color: Colors.black.withOpacity(0.2))
          ]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "CPRC KKM\n",
                    style: TextStyle(
                        fontFamily: "MazzardH-SemiBold",
                        fontSize: 14.0,
                        color: Colors.black)),
                TextSpan(
                    text: timestamp,
                    style: TextStyle(
                        fontFamily: "MazzardH-Medium",
                        fontSize: 11.0,
                        height: 1.3,
                        color: Colors.black))
              ])),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: textWidget,
            ),
          ),
          Expanded(
            child: Align(alignment: Alignment.bottomCenter, child: image),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 25.0),
            child: Text(
              "Latest News",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "MazzardH-SemiBold",
                  fontSize: 18.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        NewsItem(
            height: 440.0,
            timestamp: "8 June 2021 @ 6:43 p.m.",
            textWidget: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text:
                      "Monitoring the symptoms during self-isolation at home.\n\nFollow us at: ",
                  style: TextStyle(
                      fontFamily: "MazzardH-SemiBold",
                      fontSize: 14.0,
                      color: Colors.black)),
              TextSpan(
                  text: "http://www.infosihat.com",
                  style: TextStyle(
                      fontFamily: "MazzardH-Medium",
                      fontSize: 14.0,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue))
            ])),
            image: Image.asset("assets/images/2.jpg", width: double.infinity)),
        SizedBox(height: 20.0),
        NewsItem(
            height: 470.0,
            timestamp: "8 June 2021 @ 6:43 p.m.",
            textWidget: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Pecahan kes mengikut negeri setkat 8 June 2021",
                  style: TextStyle(
                      fontFamily: "MazzardH-SemiBold",
                      fontSize: 14.0,
                      color: Colors.black)),
            ])),
            image: Image.asset(
              "assets/images/1.jpg",
              width: double.infinity,
            )),
        SizedBox(height: 20.0),
        NewsItem(
            height: 460.0,
            timestamp: "8 June 2021 @ 6:43 p.m.",
            textWidget: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "COVID-19 in Malaysia as of June 2021",
                  style: TextStyle(
                      fontFamily: "MazzardH-SemiBold",
                      fontSize: 14.0,
                      color: Colors.black)),
            ])),
            image: Image.asset(
              "assets/images/0.jpg",
              width: double.infinity,
            ))
      ],
    );
  }
}
