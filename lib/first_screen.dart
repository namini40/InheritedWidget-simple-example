import 'package:flutter/material.dart';

/**
here we aim to just use the concept of inherited widget
*/


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      counter: 5, //feed here
      child:
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Builder(builder: (context) {
                return Text('${InheritedCounter.of(context)!.counter}');//get here
              }),
            ],
          ),
        ),
    );
  }
}




class InheritedCounter extends InheritedWidget {
  InheritedCounter({Key? key, required this.child,required this.counter}) : super(key: key, child: child);

  final int counter;
  final Widget child;


  static InheritedCounter? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
  }


  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return oldWidget.counter != counter;
  }
}
