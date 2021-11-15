// import 'package:autohome/services/time.dart';
// import 'package:flutter/material.dart';

// class SideDrawer extends StatefulWidget {
//   const SideDrawer({Key? key, required IconData icon}) : super(key: key);

  

//   @override
//   _SideDrawerState createState() => _SideDrawerState();
// }

// class _SideDrawerState extends State<SideDrawer> {
//   // final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//   // void _openDrawer() {
//   //   _drawerKey.currentState!.openDrawer();
//   // }

//   // void _closeDrawer() {
//   //   Navigator.of(context).pop();
//   // }


//   @override
//   Widget build(BuildContext context) {
    
//     return Drawer(
//       // key: _drawerKey,
//       child: ListView(
//         children: <Widget>[
//           const DrawerHeader(
//             child: Text('Drawer Header'),
//             decoration: BoxDecoration(
//               color: Colors.indigo,
//             ),
//           ),
//           ListTile(
//             title: const Text('Item 1'),
//             onTap: () {
//               // _closeDrawer();
//             },
//           ),
//           ListTile(
//             title: Time(formatedTime),
//             onTap: () {
//               // _closeDrawer();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
