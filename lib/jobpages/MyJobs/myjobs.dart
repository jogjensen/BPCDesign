import 'package:flutter/material.dart';

class MyJobsPage extends StatelessWidget {
  const MyJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('My jobs'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
