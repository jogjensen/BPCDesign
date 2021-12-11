import 'package:designbpc/Menu/navigation.dart';
import 'package:flutter/material.dart';

class NewJobsPage extends StatelessWidget {
  const NewJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /// drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('New jobs'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
