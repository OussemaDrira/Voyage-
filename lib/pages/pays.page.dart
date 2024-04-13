import 'package:flutter/material.dart';

import '../menu/drawer.page.dart';
class pays extends StatelessWidget {
  const pays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('pays'),
      ),
      body: const Center(
        child: Text('page pays',
        style: TextStyle(fontSize: 22),),


      ),
    );
  }
}
