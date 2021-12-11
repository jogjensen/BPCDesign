import 'package:flutter/material.dart';

class DoneJobsPage extends StatelessWidget {
  const DoneJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Done jobs'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
