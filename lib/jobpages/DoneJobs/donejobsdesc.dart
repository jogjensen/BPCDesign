// ignore_for_file: file_names, unnecessary_new, deprecated_member_use
import 'package:flutter/material.dart';

import 'donejobs_model.dart';

class donejobdesc extends StatelessWidget {
  MyDoneJob? job;

  donejobdesc({this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job!.jobName!,
          style: const TextStyle(
            fontSize: 22
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Card(
          color: Colors.orangeAccent,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "job-id: ${job!.jobId}",
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                Text(
                    "Time punched: ${job!.timePunched}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                Text("data: ${job!.startAddress}")

              ],
            ),
          ),
        ),
      ),
    );
  }
}
