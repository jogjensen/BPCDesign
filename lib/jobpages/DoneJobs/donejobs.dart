import 'package:designbpc/api/api_service.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobs_model.dart';
import 'package:flutter/material.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobsdesc.dart';

class MyDoneJobsPage extends StatefulWidget {
    @override
    State<MyDoneJobsPage> createState() => _MyDoneJobsPageState();
}

class _MyDoneJobsPageState extends State<MyDoneJobsPage> {
  late Future<DoneJob> futureJobs;
  @override
  void initState(){
    super.initState();
    futureJobs = APIService().doneJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done jobs'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Column(
        children: [
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: DecoratedBox(decoration: BoxDecoration(

              ),
                  child: Text("Done jobs can be seen on this page\n "
                      "Tap a job to see more",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  )
              ),
            ),
          ),
          Expanded(child: FutureBuilder(
            future: futureJobs,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.hasData) {
                List<MyDoneJob> jobss = snapshot.data.donejobdata.jobs;
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
          ))
        ],
      ),
    );
  }
  Widget jobDetails(List<MyDoneJob> jobss, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => donejobdesc(job: jobss[index]),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        // height: double.infinity,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          color: Colors.orangeAccent,
          elevation: 8.0,
          shadowColor: Colors.orange,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Job number : ${jobss[index].jobNumber!}",
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
                "What was transported : ${jobss[index].whatIsTransported!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Total time punched : ${jobss[index].timePunched!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Date of transport : ${jobss[index].date!}",
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
