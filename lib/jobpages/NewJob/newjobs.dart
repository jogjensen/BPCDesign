import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/jobpages/NewJob/newJobs_model.dart';
import 'package:designbpc/jobpages/NewJob/pendingdesc.dart';
import 'package:flutter/material.dart';

class NewJobsPage extends StatefulWidget {
  const NewJobsPage({Key? key}) : super(key: key);

  @override
  State<NewJobsPage> createState() => _NewJobsPageState();
}

class _NewJobsPageState extends State<NewJobsPage> {
  late Future<PendingJob> pendingJobs;
  @override
  void initState() {
    super.initState();
    pendingJobs = APIService().pendingJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('New jobs'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    // color: Colors.lightBlue,
                    ),
                child: Text(
                  "On this page you are able to see the jobs that you have been offered\n"
                  "if you press a job, more information will be displayed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: pendingJobs,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<NewJob> pendingData = snapshot.data.data.jobs;
                  return ListView.builder(
                    itemCount: pendingData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return jobPending(pendingData, index);
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

  Widget jobPending(List<NewJob> jobss, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PendingJobsData(newJob: jobss[index]),
          ),
        );
      },
      child: Container(
        color: Colors.white,

        width: double.infinity,
        child: Card(
          color: Colors.orangeAccent,
          elevation: 1.0,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  "Start date: ${jobss[index].date!}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Start time: ${jobss[index].startTime}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Transported: ${jobss[index].whatIsTransported}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
