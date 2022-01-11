import 'package:designbpc/Menu/menupage.dart';
import 'package:designbpc/jobpages/NewJob/newjobs.dart';
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
                  "Job-Id: ${newJob!.jobId!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Truckdriver name & licenseplate: ${newJob!.contactPersonName!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Truckdriver Email: ${newJob!.contactPersonEmail!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Truckdriver Phone: ${newJob!.contactPersonPhone!}",
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
                  "Start Time: ${newJob!.startTime!}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start Date: ${newJob!.date!}",
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
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewJobsPage()),
                    );
                  },
                  child: const Text(
                      "Reject",
                  style: TextStyle(fontSize: 20),
                  ),
                ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewJobsPage()),
                      );
                    },
                    child: const Text(
                      "Accept",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
