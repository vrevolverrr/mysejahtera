import 'package:flutter/material.dart';
import 'package:mysj/data/helpers.dart';

class QuestionsPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Question> questions;

  QuestionsPage(
      {required this.title, required this.subtitle, required this.questions});

  _QuestionsPageState createState() =>
      _QuestionsPageState(title, subtitle, questions);
}

class _QuestionsPageState extends State<QuestionsPage> {
  final String title;
  final String subtitle;
  final List<Question> questions;
  int questionNumber = 1;

  final _pageController = PageController();

  _QuestionsPageState(this.title, this.subtitle, this.questions);

  // ignore: non_constant_identifier_names
  Widget QuestionTile(Question question, void Function(int type) callback) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question.title,
            style: TextStyle(
                color: Color(0xff1c1c1c), fontSize: 30.0, height: 1.5),
          ),
          SizedBox(height: 15.0),
          (question.subtitle == "")
              ? SizedBox()
              : Text(
                  question.subtitle,
                  style: TextStyle(
                      color: Color(0xff4f4f4f), fontSize: 20.0, height: 1.5),
                ),
          SizedBox(height: 20.0),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff5098fe)),
                      ),
                      onPressed: () {
                        callback(0);
                      },
                      child: SizedBox(
                          width: 90.0,
                          height: 45.0,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("No",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white))))),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff5098fe)),
                      ),
                      onPressed: () {
                        callback(1);
                      },
                      child: SizedBox(
                          width: 90.0,
                          height: 45.0,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("Yes",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white)))))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff5081fe),
      body: SizedBox.expand(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: Text(
                subtitle,
                style: TextStyle(
                    fontSize: 18.0, color: Colors.white, letterSpacing: 1.0),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                          color: Color(0xff172445).withOpacity(0.25),
                          borderRadius: BorderRadius.circular(3.0)),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      width: (300.0 / questions.length) * questionNumber,
                      height: 5.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.0)),
                    )
                  ],
                ),
                SizedBox(width: 15.0),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: questionNumber.toString(),
                      style: TextStyle(
                          fontFamily: "MazzardH-Bold",
                          fontSize: 18.0,
                          letterSpacing: 1.2)),
                  TextSpan(
                      text: "/${questions.length}",
                      style: TextStyle(
                          fontFamily: "MazzardH-Medium",
                          fontSize: 15.0,
                          letterSpacing: 1.2))
                ])),
              ],
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 360.0,
                  height: 450.0,
                  child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: questions
                          .asMap()
                          .entries
                          .map((entry) => QuestionTile(entry.value, (int type) {
                                setState(() {
                                  questionNumber = entry.key + 1;
                                });
                                if (entry.key == questions.length - 1) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Your response has been succesfully submitted",
                                    style: TextStyle(
                                        fontFamily: "MazzardH-SemiBold"),
                                  )));
                                  Navigator.pop(context);
                                }
                                _pageController.animateToPage(entry.key + 1,
                                    duration: Duration(milliseconds: 320),
                                    curve: Curves.fastOutSlowIn);
                              }))
                          .toList()),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
