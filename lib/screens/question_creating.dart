import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuestionCreating extends StatefulWidget {
  const QuestionCreating({Key? key}) : super(key: key);

  @override
  _QuestionCreatingState createState() => _QuestionCreatingState();
}

class _QuestionCreatingState extends State<QuestionCreating> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    Text choice1 = Text(
      "Classic  ",
      style: TextStyle(
          fontSize: height*0.02
      ),
    );

    Text choice2 = Text(
        "  Multiple choice",
        style: TextStyle(
            fontSize: height*0.02
        )
    );

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentScope = FocusScope.of(context);

        if(!currentScope.hasPrimaryFocus){
          currentScope.unfocus();
        }
      },
      child: Scaffold(
        floatingActionButton: Container(
          height: width/6,
          width: width/6,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Container(
                height: 1000,
                width: 1000,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff7F7FD5),
                          Color(0xff86A8E7),
                          Color(0xff91EAE4),
                        ]
                    )
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
            ),
          ),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, width*0.1, 20),
                  child: Text(
                    "1/16",
                    style: TextStyle(
                        fontSize: height*0.02,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width*0.1, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        child: isSwitched == false ? choice1 : Text("")
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      activeTrackColor: Colors.red,
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: Color(0xfff7a072),
                      // activeTrackColor: Color(0xff00a7e1),
                      inactiveThumbColor: Color(0xff00a7e1),
                    ),
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        child: isSwitched == true ? choice2 : Text("")
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width*0.05, 10, width*0.05, width*0.05),
              child: Container(
                width: width*0.9,
                height: width*0.35,
                child: SizedBox(
                  width: width*0.9,
                  height: width*0.35,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("The question", style: TextStyle(fontSize: height*0.02),),
                        SizedBox(
                          width: width/4*3,
                          child: TextField(

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            isSwitched == true ? Padding(
              padding: EdgeInsets.fromLTRB(0, width*0.05, 0, width*0.05),
              child: Row(
                children: [
                  SizedBox(width: width*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(Icons.invert_colors_on_rounded),
                      Stack(
                        children: [
                          Positioned(
                            left: 1.0,
                            top: 2.0,
                            child: Icon(CupertinoIcons.paintbrush, color: Colors.black54, size: height*0.04),
                          ),
                          Icon(CupertinoIcons.paintbrush, color: Color(0xffbfedef), size: height*0.04),
                        ],
                      ),
                      Text("  Correct", style: TextStyle(fontSize: height*0.02, letterSpacing: 2, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(width: width*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(Icons.invert_colors_on_rounded),
                      Stack(
                        children: [
                          Positioned(
                            left: 1.0,
                            top: 2.0,
                            child: Icon(CupertinoIcons.paintbrush, color: Colors.black54, size: height*0.04),
                          ),
                          Icon(CupertinoIcons.paintbrush, color: Color(0xffff773d), size: height*0.04),
                        ],
                      ),
                      Text("  Wrong", style: TextStyle(fontSize: height*0.02, letterSpacing: 2, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),)
                    ],
                  ),
                ],
              ),
            ) : Container(),
            isSwitched == true ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(width*0.02),
                  child: Container(
                    width: width*0.46,
                    height: width/6,
                    child: const Card(
                      elevation: 10,
                      color: Color(0xffbfedef),
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(
                              color: Color(0xff313638)
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width*0.02),
                  child: Container(
                    width: width*0.46,
                    height: width/6,
                    child: const Card(
                      elevation: 10,
                      color: Color(0xffff773d),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ) : Padding(
              padding: EdgeInsets.fromLTRB(width*0.05, 0, width*0.1, 0),
              child: Text(
                  "The answer:",
                  style: TextStyle(
                      fontSize: height*0.02,
                      letterSpacing: 2
                  )
              ),
            ),
            isSwitched == true ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(width*0.02),
                  child: Container(
                    width: width*0.46,
                    height: width/6,
                    child: const Card(
                      elevation: 10,
                      color: Color(0xffff773d),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width*0.02),
                  child: Container(
                    width: width*0.46,
                    height: width/6,
                    child: const Card(
                      elevation: 10,
                      color: Color(0xffff773d),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
              ],
            ) : Padding(
              padding: EdgeInsets.all(width*0.04),
              child: Container(
                width: width*0.92,
                height: width/6,
                child: const Card(
                  elevation: 10,
                  color: Color(0xffbfedef),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width*0.01, width*0.05, width*0.1, width*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height*0.05,
                    width: height*0.05,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/idea.png"),
                        )
                    ),
                  ),
                  Text(
                    "Hints:",
                    style: TextStyle(
                      fontSize: height*0.02,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width*0.04),
              child: Container(
                width: width*0.92,
                height: width/6,
                child: const Card(
                  elevation: 10,
                  color: Color(0xffbfedef),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
