import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/jobpages/MyJobs/jobDesc.dart';
import 'package:designbpc/jobpages/MyJobs/joblist_model.dart';
import 'package:flutter/material.dart';

class MyJobsPage extends StatefulWidget {
  @override
  State<MyJobsPage> createState() => _MyJobsPageState();
}

class _MyJobsPageState extends State<MyJobsPage> {
  late Future<JobList> futureJobs;
  @override
  void initState() {
    super.initState();
    futureJobs = APIService().jobList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My jobs'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Column(
        children:[
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // color: Colors.lightBlue,
                ),
                child: Text(
                  "On this page you are able to see the jobs that you have accepted.\n"
                      "if you press a job, more information will be displayed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),

                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: futureJobs,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Job> jobss = snapshot.data.jobData.jobs;
                  return ListView.builder(
                    itemCount: jobss.length,
                    itemBuilder: (BuildContext context, int index) {
                      return jobDetails(jobss, index);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget jobDetails(List<Job> jobss, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobDesc(job: jobss[index]),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        height: 210,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.orangeAccent,
          elevation: 8.0,
          shadowColor: Colors.orange,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Job number : ${jobss[index].jobName!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Start address : ${jobss[index].startAddress!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "End address : ${jobss[index].endAddress!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Start time : ${jobss[index].startTime!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Start date: ${jobss[index].date!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Transported : ${jobss[index].whatIsTransported!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
