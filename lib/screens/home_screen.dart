// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:autohome/decorations/home_src_container.dart';
import 'package:autohome/services/time.dart';
import 'package:flutter/material.dart';

import 'cctv_screen.dart';
import 'lights_screen.dart';
import 'shutter_screen.dart';
import 'temperature_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _openDrawer() {
    _drawerKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  var cardImage = const NetworkImage(
      'https://source.unsplash.com/random/800x600?smarthome,automation,iot');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      key: _drawerKey,
      appBar: AppBar(
        title: Time(formatedTime),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          iconSize: 35,
          icon: const Icon(Icons.menu_open),
          onPressed: _openDrawer,
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: const Icon(Icons.settings),
            onPressed: _openDrawer,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                _closeDrawer();
              },
            ),
            ListTile(
              title: Time(formatedTime),
              onTap: () {
                _closeDrawer();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Container(
          //   // height: 100,
          //   width: double.infinity,
          //   color: Colors.deepPurple,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.only(left: 10, top: 20),
          //         child: const Text(
          //           'Home Automation',
          //           style: TextStyle(
          //             fontSize: 35,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         padding: const EdgeInsets.only(left: 10, bottom: 30),
          //         child: const Text(
          //           'What would you like to monitor ?',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Use 👆 if you want to use a just Header Text
          // Use 👇 if you want to use a Header Text with a Image

          Card(
            elevation: 5,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Ink.image(
                    image: cardImage,
                    fit: BoxFit.cover,
                    height: 160.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Auto Home",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'What would you like to monitor ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: const <Widget>[
                  HomeContainer(
                    title: "LIGHTS",
                    image: "assets/Icons/Edge_Icons/lightbulb-r.svg",
                    navigate: LightScreen(),
                  ),
                  HomeContainer(
                    title: "THERMAL",
                    image: "assets/Icons/Edge_Icons/cloud-r.svg",
                    navigate: TempScreen(),
                  ),
                  HomeContainer(
                    title: "CCTV",
                    image: "assets/Icons/Edge_Icons/camera-r.svg",
                    navigate: CctvScreen(),
                  ),
                  HomeContainer(
                    title: "SHUTTER",
                    image: "assets/Icons/Edge_Icons/lock-r.svg",
                    navigate: ShutterScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
