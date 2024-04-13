import 'package:flutter/material.dart';

import '../menu/drawer.page.dart';
class parametre extends StatelessWidget {
  const parametre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('parametre'),
      ),
      body: const Center(
        child: Text('page parametre',
        style: TextStyle(fontSize: 22),),


      ),
    );
  }
}
