import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// DateTime now = DateTime.now();
// String currentTime =
//     "${now.hour.toString()}:${now.minute.toString()}:${now.second.toString()}";

var formatedTime = DateFormat('HH:mm:ss').format(DateTime.now());

class Time extends StatefulWidget {
  const Time(String currentTime, {Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      // ------------- Logic to update the time per minute -----------------
      // var previousTime = DateTime.now().add(Duration(seconds: -1) ).minute;
      // var currentTime = DateTime.now().minute;
      // if(previousTime != currentTime){
      //   setState(() {
      //     formatedTime = DateFormat('HH:mm:ss').format(DateTime.now());
      //   });
      // }
      // --------------------------------------------------------------------
      setState(() {
        formatedTime = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(formatedTime);
    return Text(formatedTime);
  }
}
