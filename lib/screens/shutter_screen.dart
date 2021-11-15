import 'package:autohome/decorations/pages_header_container.dart';
import 'package:flutter/material.dart';

class ShutterScreen extends StatefulWidget {
  const ShutterScreen({ Key? key }) : super(key: key);

  @override
  _ShutterScreenState createState() => _ShutterScreenState();
}

class _ShutterScreenState extends State<ShutterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shutter Screen'),
      ),
      body: Column(
        children: [
          const PagesHeaderContainer(
            title: 'SHUTTER',
            description: 'Open and close the Shutter\'s Door',
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