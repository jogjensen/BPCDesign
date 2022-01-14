import 'package:designbpc/Menu/navigation.dart';
import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobs.dart';
import 'package:designbpc/jobpages/MyJobs/myjobs.dart';
import 'package:designbpc/jobpages/NewJob/newjobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class menuPage extends StatelessWidget {
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
                child: const Text('New jobs', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewJobsPage()),
                  );
                },
              ),

              ElevatedButton(
                child: const Text('My jobs', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyJobsPage()),
                  );
                },
              ),

              ElevatedButton(
                child: const Text('Done jobs', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, shape: border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDoneJobsPage()),
                  );
                },
              ),

              ElevatedButton(
                child: const Text('Maps', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, shape: border),
                onPressed: _launchURLMaps
              ),

              ElevatedButton(
                child: const Text('Print for special transports', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent, shape: border),
                onPressed: _launchURL

              ),
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
