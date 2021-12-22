import 'package:designbpc/Menu/navigation.dart';
import 'package:designbpc/jobpages/MyJobs/myjobs.dart';
import 'package:designbpc/jobpages/NewJob/newjobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class menuPage extends StatelessWidget {
  const menuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('BookPilotcar'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        primary: false,
        crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
      children: <Widget> [
        ElevatedButton(
          child: Text('My jobs'),
          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyJobsPage()),
            );
          },
        ),

        ElevatedButton(
          child: Text('New jobs'),
          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyJobsPage()),
            );
          },
        ),

        ElevatedButton(
          child: Text('Earlier jobs'),
          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyJobsPage()),
            );
          },
        ),

       MaterialButton(
         padding: const EdgeInsets.all(1.0),
           textColor: Colors.black,
           splashColor: Colors.black,
           child: Container(
             decoration: const BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/maps.png'),
                 fit: BoxFit.cover),

               ),
               child: const Padding(
                padding: EdgeInsets.all(10.0),
                   child: Center(
                     child: FittedBox(
                       fit: BoxFit.fill,
                       child: Text(
                         "Maps",
                       style: TextStyle(fontSize: 20),
                       ),
                   ),
                 ),
             )
           ),
         onPressed: _launchURLMaps,
       ),



       ElevatedButton(
         child: Text('MENU'),
         style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationDrawerWidget()),
           );
         },
       ),

        MaterialButton(
          padding: const EdgeInsets.all(1.0),
          textColor: Colors.black,
          splashColor: Colors.black,
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/VejD.png'),
                    fit: BoxFit.cover),

              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      "Print\n for\n special transports",
                      style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
          ),
          onPressed: _launchURLMaps,
        ),




      ]

      ),
    );
}
void _launchURL() async {
  const _url1 = 'https://www.vejdirektoratet.dk/side/udskrift-til-saertransporter';
  if (await canLaunch(_url1)) {
    await launch(_url1);
  }
  else {
    throw 'Could not launch URL';
  }
}

void _launchURLMaps() async {
    const _url2maps = 'https://www.google.dk/maps';
    if (await canLaunch(_url2maps)) {
      await launch(_url2maps);
    }
    else {
      throw 'Could not launch URL';
    }
  }
}
