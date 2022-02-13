import 'package:flutter/material.dart';
import 'package:live_stream_test_app/screens/sign_in.dart';
import 'package:live_stream_test_app/screens/student_home_screen.dart';
import 'package:live_stream_test_app/screens/teacher_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignPage(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return StudentHomeScreen();
  }
}
