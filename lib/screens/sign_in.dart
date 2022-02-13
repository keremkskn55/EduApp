import 'package:flutter/material.dart';

import '../main.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  _SignPageState createState() => _SignPageState();
}

enum SingingCharacter { teacher, student }


class _SignPageState extends State<SignPage> {

  bool _isRadioSelected = false;

  int checker = 0;

  bool isObscure = true;

  Icon lockIcon = Icon(Icons.lock_outlined);

  SingingCharacter? _character = SingingCharacter.student;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);



    return GestureDetector(
      onTap: (){
        FocusScopeNode currentScope = FocusScope.of(context);

        if(!currentScope.hasPrimaryFocus){
          currentScope.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          // color: Color.fromRGBO(242, 255, 255, 1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFFEFBA),
                    // Color(0xff86A8E7),
                    // Color(0xff91eae4),
                    Colors.white
                    // Color(0xff91eae4),
                    // Colors.white,
                    // // Color(0xffc4e0e5),
                    // // Color(0xffc4e0e5),
                    // // Color(0xff4ca1af),
                    // Color(0xffc3cfe9),
                  ]
              )
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(width*0.05, 0,width*0.05, width*0.05),
                      child: Container(
                        child: Text(
                          checker == 0 ? "Sign In" : "Register",
                          style: TextStyle(
                              fontSize: height*0.03
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(width*0.05, width*0.02,width*0.05, width*0.02),
                      child: const TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            labelText: "Enter e-mail",

                            labelStyle: TextStyle(
                              backgroundColor: Colors.transparent,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(width*0.05, width*0.02,width*0.05, width*0.02),
                      child: TextField(
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: lockIcon,
                              onPressed: (){
                                if(lockIcon.icon.toString() == "IconData(U+0F197)"){
                                  print("I ran outlined");
                                  setState(() {
                                    lockIcon = Icon(Icons.lock_open);
                                    isObscure = false;
                                  });
                                  print(lockIcon.toString());
                                }else if(lockIcon.icon.toString() == "IconData(U+0E3B0)"){
                                  print("I ran open");
                                  setState(() {
                                    lockIcon = Icon(Icons.lock_outlined);
                                    isObscure = true;
                                  });
                                  print(lockIcon.toString());
                                }
                              },
                            ),

                            suffixIconColor: Colors.grey[700],
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            labelText: "Password",

                            labelStyle: TextStyle(
                              backgroundColor: Colors.transparent,
                            )
                        ),
                      ),
                    ),
                    checker == 1 ? Padding(
                      padding: EdgeInsets.fromLTRB(width*0.05, width*0.02,width*0.05, 0),
                      child: TextField(
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: lockIcon,
                              onPressed: (){
                                if(lockIcon.icon.toString() == "IconData(U+0F197)"){
                                  print("I ran outlined");
                                  setState(() {
                                    lockIcon = Icon(Icons.lock_open);
                                    isObscure = false;
                                  });
                                  print(lockIcon.toString());
                                }else if(lockIcon.icon.toString() == "IconData(U+0E3B0)"){
                                  print("I ran open");
                                  setState(() {
                                    lockIcon = Icon(Icons.lock_outlined);
                                    isObscure = true;
                                  });
                                  print(lockIcon.toString());
                                }
                              },
                            ),

                            suffixIconColor: Colors.grey[700],
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 1
                              ),
                            ),
                            labelText: "Repeat the password",

                            labelStyle: TextStyle(
                              backgroundColor: Colors.transparent,
                            )
                        ),
                      ),
                    ) : Container(),
                    checker == 1 ? Padding(
                      padding: EdgeInsets.fromLTRB(0, width*0.02, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width/3,
                            child: RadioListTile<SingingCharacter>(
                              title: const Text('Student'),
                              value: SingingCharacter.student,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: width/3,
                            child: RadioListTile<SingingCharacter>(
                              title: const Text('Teacher'),
                              value: SingingCharacter.teacher,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ):Container(),
                    Center(
                        child: GestureDetector(
                          onTap: (){
                            print("setted");
                            if(checker == 0) {
                              setState(() {
                                checker = 1;
                              });
                            } else if(checker == 1) {
                              setState(() {
                                checker = 0;
                              });
                            }
                            print(checker);
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(width/8, 0, width/8, width/16),
                            child: Container(
                              height: width/8,
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  checker == 0 ? "You don't have an account?" : "Sign In?",
                                  style: TextStyle(
                                      fontSize: height*0.015,
                                      color: Color(0xff717ec3),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainApp()));
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width/8, 0, width/8, 0),
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Container(
                            height: 60,
                            width: width/4*3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff83a4d4),
                                      Color(0xffb6fbff)
                                    ]
                                )
                            ),
                            child: Center(
                                child: Text(
                                  "Start studying!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
