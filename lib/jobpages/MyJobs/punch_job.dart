import 'dart:convert';

import 'package:designbpc/Menu/menupage.dart';
import 'package:designbpc/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PunchJob extends StatefulWidget {
  var jobName;
  var jobId;
  PunchJob({this.jobName, this.jobId});

  @override
  State<PunchJob> createState() => _PunchJobState();
}

class _PunchJobState extends State<PunchJob> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
  late String completed_on = dateFormat.format(DateTime.now());

  // var _chosenDateTime;
  // var _chosenEndDateTime;

  TextEditingController waitTimeInHour = TextEditingController();
  TextEditingController waitTimeInMinute = TextEditingController();
  TextEditingController timeToEscortStartInHour = TextEditingController();
  TextEditingController timeToEscortStartInMinute = TextEditingController();
  TextEditingController timeFromEscortEndInHour = TextEditingController();
  TextEditingController timeFromEscortEndInMinute = TextEditingController();
  TextEditingController potentialBridgeFee = TextEditingController();
  TextEditingController potentialFerryFee = TextEditingController();
  TextEditingController truckLicensePlate = TextEditingController();
  TextEditingController startdatePicker = TextEditingController();
  TextEditingController endDatePicker = TextEditingController();
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 300,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (val) {
                    setState(() {
                      startdatePicker.text = dateFormat.format(val);
                      // _chosenDateTime = val;
                    });
                  },
                ),
              ),

              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () {
                  // String string = dateFormat.format(StartdatePicker.tex);
                  // print(string);
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ));
  }

  void _showEndDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 300,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                    use24hFormat: true,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        endDatePicker.text = dateFormat.format(val);
                      });
                    }),
              ),
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () {
                  // String string = dateFormat.format(_chosenEndDateTime);
                  // print(string);
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Punch job ( ${widget.jobName} )"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "On this page you have to fill information about YES",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child:
            const Text("Hold on ⓘ to see how to fill and what to fill..."),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Time to escort Start ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter hour and minutes ",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: timeToEscortStartInHour,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Hours"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: timeToEscortStartInMinute,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Minutes"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Escort Start ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "choose the start date and then click ok ",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    enabled: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "cannot be empty";
                      }
                    },
                    controller: startdatePicker,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: const Text(
                      "Choose Date ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Escort End ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "choose the end date and then click ok",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    enabled: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "cannot be empty";
                      }
                    },
                    controller: endDatePicker,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text(""),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showEndDatePicker(context);
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: const Text(
                      "Choose Date ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Time from escort end  ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter hours and minutes",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: timeFromEscortEndInHour,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Hours"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: timeFromEscortEndInMinute,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Minutes"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Wait time ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter wait time ",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: waitTimeInHour,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Hours"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                          },
                          controller: waitTimeInMinute,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Minutes"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Potential ferry fee ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter poterntial ferry fee",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "cannot be empty";
                      }
                    },
                    controller: potentialFerryFee,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text("Ferry Fee"),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Potential bridge fee ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter potential bridge fee ",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "cannot be empty";
                      }
                    },
                    controller: potentialBridgeFee,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text("bridge Fee"),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orangeAccent,
                  child: Row(
                    children: [
                      const Text(
                        "Truck license Plate ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "enter liscense plate number",
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "can not be empty";
                      }
                    },
                    controller: truckLicensePlate,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text("License "),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    height: 70,
                    minWidth: double.infinity,
                    color: Colors.green,
                    onPressed: () async {
                      Map values = {
                        "jobId": widget.jobId!,
                        "startDate": startdatePicker.text,
                        "endDate": endDatePicker.text,
                        "completedOn": completed_on,
                        "waitTimeInHour": waitTimeInHour.text,
                        "waitTimeInMinute": waitTimeInMinute.text,
                        "TimeToEscortStartInHour": timeToEscortStartInHour.text,
                        "timeToEscortStartInMinute":
                        timeToEscortStartInMinute.text,
                        "timeFromEscortEndInHour": timeFromEscortEndInHour.text,
                        "timeFromEscortEndInMinute":
                        timeFromEscortEndInMinute.text,
                        "potentialBridgeFee": potentialBridgeFee.text,
                        "potentialFerryFee": potentialFerryFee.text,
                        "truckLicensePlate": truckLicensePlate.text
                      };

                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        var response = await APIService().punchJob(values);

                        var body = jsonDecode(response.body);

                        var data = body['data'];
                        var message = data['message'];
                        var code = data['code'];

                        if (code == 200) {
                          Fluttertoast.showToast(
                            msg: "$message",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => menuPage()),
                                  (route) => false);
                        } else {
                          Fluttertoast.showToast(
                            msg: "something went wrong",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                      }
                    },
                    child: const Text("Punch job"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
