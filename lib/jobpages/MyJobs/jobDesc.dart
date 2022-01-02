// ignore_for_file: file_names, unnecessary_new, deprecated_member_use
import 'package:flutter/material.dart';

import 'joblist_model.dart';

class JobDesc extends StatelessWidget {
  Job? job;

  JobDesc({this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job!.jobName!,
          style: const TextStyle(
            fontSize: 22,
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
                  "Job-Id: ${job!.jobId!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Job Start Time: ${job!.startTime!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Contact Person Email: ${job!.contactPersonEmail!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Contact Person Name: ${job!.contactPersonName!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Contact Person Phone: ${job!.contactPersonPhone!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start Address: ${job!.startAddress!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "End Address : ${job!.endAddress!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Job Status: ${job!.jobStatus!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Earned : ${job!.earned!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Transported: ${job!.whatIsTransported!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
