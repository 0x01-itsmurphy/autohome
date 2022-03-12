import 'package:autohome/decorations/pages_header_container.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({ Key? key }) : super(key: key);

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Column(
        children: [
          const PagesHeaderContainer(
            title: 'TEMPERATURE',
            description: 'Monitor your Temperature',
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}