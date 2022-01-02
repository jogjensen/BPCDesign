import 'package:flutter/material.dart';

import 'newJobs_model.dart';

class PendingJobsData extends StatelessWidget {
  NewJob? newJob;
  PendingJobsData({this.newJob});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newJob!.jobName!),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Card(
          color: Colors.grey,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job-Id: ${newJob!.jobId!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Job Start Time: ${newJob!.startTime!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "contact Person Email: ${newJob!.contactPersonEmail!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "contact Person Name: ${newJob!.contactPersonName!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "contact Person Phone: ${newJob!.contactPersonPhone!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start Address: ${newJob!.startAddress!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "End Address : ${newJob!.endAddress!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Job Status: ${newJob!.jobStatus}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Earned : ${newJob!.earned!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Transported: ${newJob!.whatIsTransported!}",
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
