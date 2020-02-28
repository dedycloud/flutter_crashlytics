import 'dart:async';

import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_trace/stack_trace.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
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
  int number = 0;

  changeName(nameInput) {
    if (name == null) {
      throw IOException;
    }
    setState(() {
      this.name = nameInput;
    });
  }

  changeNumber(numberGiven) {
    if (number == 0) {
      throw new IntegerDivisionByZeroException();
    }
    setState(() {
      number = numberGiven;
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
                child: RaisedButton(
                    color: Colors.blue,
                    child: const Text('change state'),
                    onPressed: () {
                      try {
                        changeName(null);
                      } catch (exception, stack) {
                        print(DateTime.now());
                        Crashlytics.instance.setString("fatal", exception);
                        Crashlytics.instance.log("error state");
                        Crashlytics.instance.recordError(exception, stack,
                            context: 'error change state');
                      }
                    }),
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                    color: Colors.teal,
                    child: const Text('change number'),
                    onPressed: () {
                      try {
                        changeNumber(0);
                      } catch (exception, stack) {
                        print(DateTime.now());
                        Crashlytics.instance.recordError(exception, stack,
                            context: 'error change number');
                        Crashlytics.instance.log("change number");
                      }
                    }),
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
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
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
