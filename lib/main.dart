import 'package:flutter/material.dart';
import 'package:inherited_widget_example/first_screen.dart';
import 'package:inherited_widget_example/second_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('Inherited Widget'),),
      // body: FirstScreen(),
      body: SecondScreen(),
    ),);
  }
}
