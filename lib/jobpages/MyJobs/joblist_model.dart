// To parse this JSON data

import 'dart:convert';

JobList jobListFromJson(String str) =>
    JobList.fromJson(json.decode(str));

String jobListToJson(JobList data) => json.encode(data.toJson());

class JobList {
  JobList({
    this.statuscode,
    this.jobData,
    this.count,
    this.error,
  });

  int? statuscode;
  JobData? jobData;
  int? count;
  dynamic error;

  factory JobList.fromJson(Map<String, dynamic> json) => JobList(
    statuscode: json["statuscode"],
    jobData: JobData.fromJson(json["data"]),
    count: json["count"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "statuscode": statuscode,
    "data": jobData!.toJson(),
    "count": count,
    "error": error,
  };
}

class JobData {
  JobData({
    this.jobs,
  });

  List<Job>? jobs;

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
    jobs: List<Job>.from(json["Jobs"].map((x) => Job.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Jobs": List<dynamic>.from(jobs!.map((x) => x.toJson())),
  };
}

class Job {
  Job({
    this.jobId,
    this.jobNumber,
    this.jobName,
    this.hours,
    this.minutes,
    this.timePunched,
    this.date,
    this.earned,
    this.contactPersonName,
    this.contactPersonPhone,
    this.contactPersonEmail,
    this.startTime,
    this.userStartDate,
    this.jobStatus,
    this.startAddress,
    this.endAddress,
    this.documents,
    this.completionDate,
    this.completionTime,
    this.userCompletionDate,
    this.whatIsTransported,
  });

  String? jobId;
  String? jobNumber;
  String? jobName;
  double? hours;
  double? minutes;
  dynamic timePunched;
  String? date;
  double? earned;
  String? contactPersonName;
  String? contactPersonPhone;
  String? contactPersonEmail;
  String? startTime;
  int? userStartDate;
  String? jobStatus;
  String? startAddress;
  String? endAddress;
  List<Document>? documents;
  dynamic completionDate;
  dynamic completionTime;
  int? userCompletionDate;
  String? whatIsTransported;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    jobId: json["job_id"],
    jobNumber: json["job_number"],
    jobName: json["job_name"],
    hours: json["hours"],
    minutes: json["minutes"],
    timePunched: json["time_punched"],
    date: json["date"],
    earned: json["earned"],
    contactPersonName: json["contact_person_name"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonEmail: json["contact_person_email"],
    startTime: json["start_time"],
    userStartDate: json["user_start_date"],
    jobStatus: json["job_status"],
    startAddress: json["start_address"],
    endAddress: json["end_address"],
    documents: List<Document>.from(
        json["documents"].map((x) => Document.fromJson(x))),
    completionDate: json["completion_date"],
    completionTime: json["completion_time"],
    userCompletionDate: json["user_completion_date"],
    whatIsTransported: json["what_is_transported"],
  );

  Map<String, dynamic> toJson() => {
    "job_id": jobId,
    "job_number": jobNumber,
    "job_name": jobName,
    "hours": hours,
    "minutes": minutes,
    "time_punched": timePunched,
    "date": date,
    "earned": earned,
    "contact_person_name": contactPersonName,
    "contact_person_phone": contactPersonPhone,
    "contact_person_email": contactPersonEmail,
    "start_time": startTime,
    "user_start_date": userStartDate,
    "job_status": jobStatus,
    "start_address": startAddress,
    "end_address": endAddress,
    "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
    "completion_date": completionDate,
    "completion_time": completionTime,
    "user_completion_date": userCompletionDate,
    "what_is_transported": whatIsTransported,
  };
}

class Document {
  Document({
    this.name,
    this.url,
  });

  dynamic name;
  String? url;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
