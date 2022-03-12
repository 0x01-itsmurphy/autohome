// ignore_for_file: avoid_print

import 'package:autohome/decorations/custom_button.dart';
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
    try {
      response = await http.get(Uri.parse('http://192.168.4.1/on'),
          headers: {'Accept': 'text/plain'});
      setState(() {
        response = response.body;
        final status = response.toString();
        print(status);
      });
    } catch (e) {
      print(e);
    }
  }

  turnOffLed(void toggleLight) async {
    print('Turning off LED');
    try {
      response = await http.get(Uri.parse('http://192.168.4.1/off'),
          headers: {'Accept': 'text/plain'});
      setState(() {
        response = response.body;
        final status = response.toString();
        print(status);
      });
    } catch (e) {
      setState(() {
        response = e.toString();
      });
      print(e);
    }
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: _isLightOn,
            child: const Image(
              image: AssetImage('assets/Icons/lightOn.png'),
              height: 60,
              // fit: BoxFit.fill,
            ),
          ),
          Visibility(
            visible: _isLightOn == false,
            child: const Image(
              image: AssetImage('assets/Icons/lightOff.png'),
              height: 50,
              // fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          CustomButton(
            onTap: () {
              if (_isLightOn) {
                turnOffLed(toggleLight());
              } else {
                turnOnLed(toggleLight());
              }
            },
            color: _isLightOn ? Colors.green : Colors.red,
            text: _isLightOn ? 'Turn Off' : 'Turn On',
          ),
        ],
      ),
    );
  }
}
