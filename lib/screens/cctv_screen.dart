// ignore_for_file: avoid_print

import 'package:autohome/decorations/pages_header_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CctvScreen extends StatefulWidget {
  const CctvScreen({Key? key}) : super(key: key);

  @override
  _CctvScreenState createState() => _CctvScreenState();
}

class _CctvScreenState extends State<CctvScreen> {
  bool _isLightOn = false;
  var textHolder = 'Turn on the light';

  void toggleLight(bool value) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCTV'),
      ),
      body: Column(
        children: [
          const PagesHeaderContainer(
            title: 'CCTV',
            description: 'Turn on and off the lights',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    onChanged: toggleLight,
                    value: _isLightOn,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )),
              Text(
                textHolder,
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),

          // ToggleButtons(
          //   children: const <Widget>[
          //       Icon(Icons.add_comment),
          //       Icon(Icons.airline_seat_individual_suite),
          //       Icon(Icons.add_location),
          //     ],
          //   isSelected: _isLightOn,
          //   onPressed: (int index) {
          //     setState(() {
          //       _isLightOn = !_isLightOn;
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
