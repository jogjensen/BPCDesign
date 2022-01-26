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
                  "Job-id: ${job!.jobId}",
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Transported: ${job!.whatIsTransported}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start address: ${job!.startAddress}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "End address: ${job!.endAddress}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start date: ${job!.date}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Start time: ${job!.startTime}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Time to escort start in hours: ${job!.timeToEscortStartInHour}:${job!.timeToEscortStartInMinutes}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Time from escort end in hours: ${job!.timeFromEscortEndInHour}:${job!.timeFromEscortEndInMinute}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Wait time in hours: ${job!.waitTimeInHour}:${job!.waitTimeInMinutes}",
                  style: const TextStyle(
                    fontSize: 20,
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
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Ferry fee: ${job!.potentialFerryFee}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Bridge fee: ${job!.potentialBridgeFee}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Licenseplate: ${job!.truckLicensePlate}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Licenseplate: ${job!.completionTime}",
                  style: const TextStyle(
                    fontSize: 20,
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
