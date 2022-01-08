import 'package:designbpc/Menu/menupage.dart';
import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/jobpages/MyJobs/joblist_model.dart';
import 'package:designbpc/jobpages/MyJobs/myjobs.dart';
import 'package:designbpc/jobpages/NewJob/newjobs.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobs.dart';
import 'package:designbpc/loginpage.dart';
import 'package:designbpc/model/login_model.dart';
import 'package:designbpc/settings.dart';
import 'package:designbpc/support.dart';
import 'package:flutter/material.dart';
import 'package:designbpc/api/api_service.dart';

class NavigationDrawerWidget extends StatelessWidget {
  LoginResponseModel loginResponseModel = LoginResponseModel();
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          color: Colors.orange,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 48),
              buildMenuItem(
                text: 'Frontpage',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 6),
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                text: 'New jobs',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'My jobs',
                icon: Icons.directions_car_outlined,
                onClicked: () {
                  selectedItem(context, 1);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Done jobs',
                icon: Icons.directions_car_rounded,
                onClicked: () {
                  selectedItem(context, 2);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                color: Colors.white70,
              ),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                text: 'Support',
                icon: Icons.support,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                color: Colors.white70,
              ),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                text: 'Log out',
                icon: Icons.settings,
                onClicked: () => APIService().logOut().then(
                      (value) {
                    if (value["data"]["code"] == 200) {
                      return Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => loginPage(),
                          ),
                              (route) => false);
                    } else {
                      const snackBar = SnackBar(
                        duration: Duration(seconds: 5),
                        content: Text(
                          "Something went wrong!",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                      scaffoldKey.currentState?.showSnackBar(snackBar);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NewJobsPage()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MyJobsPage();
        }));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyDoneJobsPage()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SupportPage()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingsPage()));
        break;
            case 6:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => menuPage()));
        break;
    }
  }
}
