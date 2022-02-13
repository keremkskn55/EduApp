import 'dart:math';

import 'package:live_stream_test_app/models/question2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';

class QuestionsShowOff extends StatefulWidget {
  QuestionsShowOff({Key? key}) : super(key: key);

  @override
  _QuestionsShowOffState createState() => _QuestionsShowOffState();
}

class _QuestionsShowOffState extends State<QuestionsShowOff> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  PageController _pageController = PageController();

  int chosen = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Question2> questions = [
      Question2(
          type: "multiple",
          title: "I am the question",
          answers: ["1", "2", "3", "4"],
          correctAnswer: "2",
          hint: "I am the hint"),
      Question2(
          type: "multiple",
          title: "I am the question",
          answers: ["1", "2", "3", "4"],
          correctAnswer: "2",
          hint: "I am the hint"),
      Question2(
          type: "multiple",
          title: "I am the question",
          answers: ["1", "2", "3", "4"],
          correctAnswer: "2",
          hint: "I am the hint"),
      Question2(
          type: "classic",
          title: "I am the question",
          answers: [],
          correctAnswer: "2",
          hint: "I am the hint"),
    ];
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              LinearProgressPageIndicator(
                itemCount: questions.length,
                currentPageNotifier: _currentPageNotifier,
                height: 10,
                width: width,
                progressColor: Colors.pink,
                backgroundColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Text(
                              "${_currentPageNotifier.value + 1}/${questions.length}",
                              style: TextStyle(fontSize: height * 0.03),
                            )),
                      )),
                ],
              ),
              Container(
                height: height - 70,
                width: width,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(width * 0.05, 10,
                                    width * 0.05, width * 0.05),
                                child: Container(
                                  width: width * 0.9,
                                  height: width * 0.35,
                                  child: SizedBox(
                                    width: width * 0.9,
                                    height: width * 0.35,
                                    child: Card(
                                      elevation: 10,
                                      child: Center(
                                        child: Text(
                                          questions[index].title!,
                                          style: TextStyle(
                                              fontSize: height * 0.03),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height / 10,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.05,
                                        width: height * 0.05,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage("assets/idea.png"),
                                        )),
                                      ),
                                      Text(
                                        "Hint",
                                        style: TextStyle(
                                          fontSize: height * 0.02,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              questions[index].type == "multiple"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chosen = 1;
                                              });
                                            },
                                            child: Container(
                                              width: width * 0.46,
                                              height: width / 6,
                                              child: Card(
                                                elevation: 10,
                                                color: chosen != 1
                                                    ? Color(0xffbfedef)
                                                    : Colors.greenAccent,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: FittedBox(
                                                        child: Center(
                                                            child: Text(
                                                      questions[index]
                                                          .answers![0],
                                                      style: TextStyle(
                                                          color: chosen == 1
                                                              ? Colors.white
                                                              : Colors.black),
                                                    )))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chosen = 2;
                                              });
                                            },
                                            child: Container(
                                              width: width * 0.46,
                                              height: width / 6,
                                              child: Card(
                                                elevation: 10,
                                                color: chosen != 2
                                                    ? Color(0xffbfedef)
                                                    : Colors.greenAccent,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: FittedBox(
                                                        child: Center(
                                                            child: Text(
                                                      questions[index]
                                                          .answers![1],
                                                      style: TextStyle(
                                                          color: chosen == 2
                                                              ? Colors.white
                                                              : Colors.black),
                                                    )))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Center(
                                      child: Container(
                                        width: width * 0.92,
                                        height: width / 6,
                                        child: const Card(
                                          elevation: 10,
                                          color: Color(0xffbfedef),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.white))),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              questions[index].type == "multiple"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chosen = 3;
                                              });
                                            },
                                            child: Container(
                                              width: width * 0.46,
                                              height: width / 6,
                                              child: Card(
                                                elevation: 10,
                                                color: chosen != 3
                                                    ? Color(0xffbfedef)
                                                    : Colors.greenAccent,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: FittedBox(
                                                        child: Center(
                                                            child: Text(
                                                      questions[index]
                                                          .answers![2],
                                                      style: TextStyle(
                                                          color: chosen == 3
                                                              ? Colors.white
                                                              : Colors.black),
                                                    )))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                chosen = 4;
                                              });
                                            },
                                            child: Container(
                                              width: width * 0.46,
                                              height: width / 6,
                                              child: Card(
                                                elevation: 10,
                                                color: chosen != 4
                                                    ? Color(0xffbfedef)
                                                    : Colors.greenAccent,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: FittedBox(
                                                        child: Center(
                                                            child: Text(
                                                      questions[index]
                                                          .answers![3],
                                                      style: TextStyle(
                                                          color: chosen == 4
                                                              ? Colors.white
                                                              : Colors.black),
                                                    )))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(width / 4 * 3, 100, 20, 50),
                            child: TextButton(
                              onPressed: () {
                                index + 1 != questions.length
                                    ? _pageController.nextPage(
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.bounceOut)
                                    : Navigator.pop(context);
                              },
                              child: Text(
                                index + 1 == questions.length
                                    ? "Close"
                                    : "Next",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 2),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    onPageChanged: (int index) {
                      _currentPageNotifier.value = index;
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
