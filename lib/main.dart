import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage1/pages/authentification.page.dart';
import 'package:voyage1/pages/contact.page.dart';
import 'package:voyage1/pages/gallerie.page.dart';
import 'package:voyage1/pages/metio.page.dart';
import 'package:voyage1/pages/parametre.page.dart';
import 'package:voyage1/pages/pays.page.dart';

import 'pages/home.page.dart';
import 'pages/inscription.page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/inscription': (context) =>  InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/home': (context) => const HomePage(),
    '/contact': (context) => const contact(),
    '/gallerie': (context) =>  GalleriePage(),
    '/metio': (context) => const metio(),
    '/parametre': (context) => const parametre(),
    '/pays': (context) =>  pays(),
  };



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool conn = snapshot.data!.getBool('connecte') ?? false;
            if (conn) {
              return const HomePage();
            } else {
              return AuthentificationPage();
            }
          }
          return AuthentificationPage();
        },
      ),
    );
  }
}
