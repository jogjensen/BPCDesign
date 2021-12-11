import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
