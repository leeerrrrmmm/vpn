import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            //TODO make drawable
          }, icon: Icon(Icons.menu))
        ],
        title: Text('HIDE VPN'),
        centerTitle: true,
      ),
    );
  }
}
