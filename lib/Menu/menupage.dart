import 'dart:async';
import 'dart:math';

import 'package:designbpc/Menu/controller.dart';
import 'package:designbpc/Menu/navigation.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobs.dart';
import 'package:designbpc/jobpages/MyJobs/myjobs.dart';
import 'package:designbpc/jobpages/NewJob/newjobs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class menuPage extends StatefulWidget {
  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  Timer? timer;
  Random random =  Random();
  var randomNumber = 10;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      Duration(minutes: randomNumber),
          (Timer t) async {
        init();
        Controller().locationService();
      },
    );
  }

  init() {
    randomNumber = random.nextInt(15) + 10;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('BookPilotcar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.count(
            padding: const EdgeInsets.all(10),
            primary: false,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 1,
            childAspectRatio: 4,
            children: <Widget>[
              ElevatedButton(
                child: const Text(
                  'My jobs',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyJobsPage()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                  'New jobs',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewJobsPage()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                  'Earlier jobs',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDoneJobsPage()),
                  );
                },
              ),
              ElevatedButton(
                  child: const Text(
                    'Maps',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent, shape: border),
                  onPressed: _launchURLMaps),
              ElevatedButton(
                  child: const Text(
                    'Print for special transports',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent, shape: border),
                  onPressed: _launchURL),
            ]),
      ),
    );
  }

  void _launchURL() async {
    const _url1 =
        'https://www.vejdirektoratet.dk/side/udskrift-til-saertransporter';
    if (await canLaunch(_url1)) {
      await launch(_url1);
    } else {
      throw 'Could not launch URL';
    }
  }

  void _launchURLMaps() async {
    const _url2maps = 'https://www.google.dk/maps';
    if (await canLaunch(_url2maps)) {
      await launch(_url2maps);
    } else {
      throw 'Could not launch URL';
    }
  }
}
