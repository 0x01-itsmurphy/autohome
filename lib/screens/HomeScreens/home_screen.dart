// ignore_for_file: avoid_print

import 'package:autohome/decorations/home_src_container.dart';
import 'package:autohome/screens/Drawer/side_drawer.dart';
import 'package:autohome/screens/HomeScreens/widgets/header_widgets.dart';
import 'package:autohome/screens/TempratureScreen/temperature_screen.dart';
import 'package:autohome/services/time.dart';
import 'package:flutter/material.dart';

import '../cctv_screen.dart';
import '../lights_screen.dart';
import '../shutter_screen.dart';
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

  var cardImage = const NetworkImage(
      'https://cdn.pixabay.com/photo/2021/12/27/04/39/iot-6896268_960_720.jpg');

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
          iconSize: 26,
          icon: const Icon(Icons.menu_open),
          onPressed: _openDrawer,
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 26,
            icon: const Icon(Icons.settings),
            onPressed: _openDrawer,
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          HeaderWidget(cardImage: cardImage),
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
