// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LivingRoomSwitch extends StatefulWidget {
  const LivingRoomSwitch({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LivingRoomSwitchState createState() => _LivingRoomSwitchState();
}

class _LivingRoomSwitchState extends State<LivingRoomSwitch> {
  bool _isLightOn = false;

  void toggleLight() {
    setState(() {
      _isLightOn = !_isLightOn;
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var response;

  turnOnLed(void toggleLight) async {
    print('Turning on LED');
    response = await http.get(Uri.parse('http://192.168.4.1/on'),
        headers: {'Accept': 'text/plain'});
    setState(() {
      response = response.body;
      final status = response.toString();
      print(status);
    });
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              // color: Colors.deepPurple[300],
              color: _isLightOn ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),

            child: newMethod(),

          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  TextButton newMethod() {
    return TextButton(
      onPressed: () {
        if (_isLightOn) {
          turnOffLed(toggleLight());
        } else {
          turnOnLed(toggleLight());
        }
      },
      child: Text(
        _isLightOn ? 'Turn Off' : 'Turn On',
        style: const TextStyle(
          fontSize: 20,
          // color: _isLightOn
          //     ? Colors.redAccent
          //     : Colors.blueAccent,
          color: Colors.white,
        ),
      ),
    );
  }
}
