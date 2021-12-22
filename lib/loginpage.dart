import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/model/login_model.dart';
import 'package:flutter/material.dart';
import 'Menu/menupage.dart';
import 'model/login_model.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel(email: '', password: '');
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Form(
            key: globalFormKey,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/logo.png',
                  width: 120.0,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'BOOKPILOTCAR',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (input) => requestModel.email = input!,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter some email';
                    }
                    return null;
                  },
                  decoration: (const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true,
                  )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (input) => requestModel.password = input!,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter some password';
                    }
                    return null;
                  },
                  decoration: (const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true,
                  )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: <Widget>[
                    ButtonTheme(
                      height: 50,
                      disabledColor: Colors.blueAccent,
                      child: RaisedButton(
                        disabledElevation: 4.0,
                        onPressed: () {
                          if (validateAndSave()) {
                            print(requestModel.toJson());
                            APIService().login(requestModel).then(
                                  (value) {
                                if (value.data!.token!.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const menuPage(),
                                    ),
                                  );
                                } else {
                                  var snackBar = SnackBar(
                                    content: Text(
                                      value.error.message!.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                  scaffoldKey.currentState!
                                      .showSnackBar(snackBar);
                                }
                              },
                            );

                            setState(() {
                              isApiCallProcess = true;
                            });
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('New user? Sign up here')
                  ],
                )
              ]),
            ),
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
