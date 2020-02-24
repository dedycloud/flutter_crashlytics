import 'dart:async';

import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_trace/stack_trace.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
//  Crashlytics.instance.setUserIdentifier('123');
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned(() {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  final List<int> list = <int>[];

  String name = '';
  int number=0;

  changeName(nameInput) {
    if(name==null){
        throw IOException;
    }
    setState(() {
      this.name = nameInput;
    });
  }

  changeNumber(numberGiven){
    if(number==0){
      throw new IntegerDivisionByZeroException();
    }
    setState(() {
      number=numberGiven;
    });
  }
  void loop() {
    for (int b = 1; b > 0; b++) {
      print(list[-1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crashlytics example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Text(name)),
              RaisedButton(
                  color: Colors.blue,
                  child: const Text('changeName'),
                  onPressed: () {
                    try {
                      changeName(null);
                    } catch (exception, stack) {
                      print(DateTime.now());
                      Crashlytics.instance.recordError(exception, stack,
                          context: 'error changeName');
                    }
                  }),
              Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Text(number.toString())),
              RaisedButton(
                color: Colors.teal,
                  child: const Text('change number'),
                  onPressed: () {
                    try {
                      changeNumber(0);
                    } catch (exception, stack) {
                      print(DateTime.now());
                      Crashlytics.instance.recordError(exception, stack,
                          context: 'error changeName');
                    }
                  }),
              RaisedButton(
                  child: const Text('Async out of bounds'),
                  color: Colors.blue,
                  onPressed: () {
                    print(DateTime.now());
                    print('Async out of bounds');
                    Future<void>.delayed(const Duration(seconds: 2), () {
                      final List<int> list = <int>[];
                      print(list[90]);
                    });
                  }),
              RaisedButton(
                  color: Colors.amber,
                  child: const Text('Trhow Record Error'),
                  onPressed: () {
                    try {
                      throw 'error_example';
                    } catch (exception, stack) {
                      Crashlytics.instance.recordError(exception, stack,
                          context: 'error as an example');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
