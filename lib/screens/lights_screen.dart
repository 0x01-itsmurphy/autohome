// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';

import 'package:autohome/decorations/lights_container.dart';
import 'package:autohome/decorations/pages_header_container.dart';
import 'package:autohome/screens/Lights/living_room.dart';
// import 'package:autohome/services/time.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LightScreen extends StatefulWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  _LightScreenState createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool _isLightOn = false;

  void toggleLight() {
    setState(() {
      _isLightOn = !_isLightOn;
    });
  }

  var response;

  turnOnLed(void toggleLight) async {
    print('Turning on LED');
    try {
      response = await http.get(
        Uri.parse('http://192.168.4.1/on'),
        headers: {'Accept': 'text/plain'},
      );
      setState(() {
        response = response.body;
        final status = response.toString();
        print(status);
      });
    } catch (e) {
      print(e);
      if (e is SocketException) {
        print('SocketException ${e.toString()}');
      } else if (e is TimeoutException) {
        print('TimeoutException ${e.toString()}');
      } else {
        print('Unknown exception ${e.toString()}');
      }
    }
  }

  turnOffLed(void toggleLight) async {
    print('Turning off LED');
    response = await http.get(Uri.parse('http://192.168.4.1/off'),
        headers: {'Accept': 'text/plain'});
    setState(() {
      response = response.body;
      final status = response.toString();
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        // title: Time(formatedTime),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const PagesHeaderContainer(
            title: 'Lights',
            description: 'Turn on and off the lights',
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: const <Widget>[
                  LivingRoomSwitch(title: "Living Room"),
                  LightsContainer(title: 'Kitchen'),
                  LightsContainer(title: 'Bedroom'),
                  LightsContainer(title: 'Bathroom'),
                ],
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                if (_isLightOn) {
                  turnOffLed(toggleLight());
                } else {
                  turnOnLed(toggleLight());
                }
              },
              child: Container(
                color: _isLightOn ? Colors.green : Colors.red,
                child: Text(
                  _isLightOn ? 'Turn off light' : 'Turn on light',
                  style: TextStyle(
                    color: _isLightOn ? Colors.redAccent : Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
