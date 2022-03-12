import 'package:autohome/screens/Drawer/settings.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/64863725'),
            ),
            accountName: Text("Manish Kumar"),
            accountEmail: Text("itsmurphy@protonmail.com"),
          ),
          ListTile(
            title: const Text('Saved'),
            trailing: const Icon(Icons.favorite),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text("Settings"),
            trailing: const Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sign Out"),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () {
              _closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}
