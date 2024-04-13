import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:voyage1/config/global.params.dart';
/*
class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Colors.blue])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profil.jpg"),
                radius: 80,
              ),
            )),
        ListTile(
          title: Text('Accueil', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.home, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/home");
          },
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Météo', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.sunny_snowing, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Gallerie', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.photo, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Pays', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.location_city, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Contact', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.contact_page, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Paramètres', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.settings, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          height: 4,
          color: Colors.blue,
        ),
        ListTile(
          title: Text('Déconnexion', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.logout, color: Colors.blue),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () async {
            prefs = await SharedPreferences.getInstance();
            prefs.setBool("connecte", false);
            Navigator.pushNamedAndRemoveUntil(
                context, '/authentification', (route) => false);
          },
        ),
        Divider(height: 4, color: Colors.blue),
      ],
    ));
  }
}
*/
class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
                radius: 80,
              ),
            ),
          ),

          ...GlobalParams.menus.map((item) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    '${item['title']}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  leading: item['icon'],
                  trailing: const Icon(Icons.arrow_right, color: Colors.blue),
                  onTap: () async {
                    if ('${item['title']}' != "Déconnexion") {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "${item['route']}");
                    } else {

                      prefs.setBool("connecte", false);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/authentification',
                            (route) => false,
                      );
                    }
                  },
                ),
                const Divider(
                  height: 4,
                  color: Colors.blue,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
