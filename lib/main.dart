import 'dart:io';

import 'package:designbpc/Menu/controller.dart';
import 'package:designbpc/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('loggedIn');

  if (userId == "Y") {
    Controller().locationService();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookpilotcar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const loginPage(),
    );
  }
}
