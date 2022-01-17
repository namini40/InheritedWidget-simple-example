import 'package:flutter/material.dart';


/**
    here we have simple example of how inherited widget really helps us to manage our state
 */

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              WidgetB(),
              WidgetA(),
              WidgetC()
            ],
          ),
        ),

    );
  }
}




class InheritedWrapper extends StatefulWidget {
  final Widget child;
  InheritedWrapper({Key? key, required this.child}) : super(key: key);

  static InheritedWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedCounter>())!.data;
  }

  @override
  InheritedWrapperState createState() => InheritedWrapperState();
}

class InheritedWrapperState extends State<InheritedWrapper> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(child: this.widget.child, data: this,counter:counter);
  }
}

class InheritedCounter extends InheritedWidget {
  InheritedCounter({Key? key, required this.child, required this.data,required this.counter})
      : super(key: key, child: child);

  final Widget child;
  final int counter;
  final InheritedWrapperState data;

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return counter != oldWidget.counter;
  }
}


class WidgetA extends StatefulWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Increment"));
  }

  onPressed() {
    InheritedWrapperState wrapper = InheritedWrapper.of(context);
    wrapper.incrementCounter();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget B");
    return new Text('${state.counter}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget C");
    return new Text('I am Widget C');
  }
}

