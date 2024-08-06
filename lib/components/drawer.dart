import 'package:flutter/material.dart';
import 'package:notes_app_modes/components/drawer_tile.dart';
import 'package:notes_app_modes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //header
          DrawerHeader(
            child: Icon(Icons.note_add),
          ),

          //notes tile
          DrawerTile(
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
            title: "My thoughts",
          ),

          //settings tile
          DrawerTile(
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
            title: "Settings",
          ),
        ],
      ),
    );
  }
}
