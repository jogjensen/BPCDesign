import 'dart:convert';



DoneJob doneJobFromJson(String str) =>
    DoneJob.fromJson(json.decode(str));

String doneJobToJson(DoneJob data) => json.encode(data.toJson());

class DoneJob {
  DoneJob({
    this.statuscode,
    this.donejobdata,
    this.count,
    this.error,
});

  int? statuscode;
  Data? donejobdata;
  int? count;
  dynamic? error;

  factory DoneJob.fromJson(Map<String, dynamic> json) => DoneJob(
    statuscode: json["statuscode"],
    donejobdata: Data.fromJson(json["data"]),
    count: json["count"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "statuscode": statuscode,
    "data": donejobdata!.toJson(),
    "count": count,
    "error": error,
  };
}

class Data {
  Data({
    this.jobs,
  });

  List<MyDoneJob>? jobs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    jobs: List<MyDoneJob>.from(json["Jobs"].map((x) => MyDoneJob.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Jobs": List<dynamic>.from(jobs!.map((x) => x.toJson())),
  };
}

class MyDoneJob {
  MyDoneJob({
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
    this.userCompletionDate,
    this.whatIsTransported,
    this.completionDate,
    this.completionTime,
    this.escortStart,
    this.escortEnd,
    this.waitTimeInHour,
    this.waitTimeInMinutes,
    this.timeToEscortStartInHour,
    this.timeToEscortStartInMinutes,
    this.timeFromEscortEndInHour,
    this.timeFromEscortEndInMinute,
    this.potentialBridgeFee,
    this.potentialFerryFee,
    this.truckLicensePlate,

  });

  String? jobId;
  String? jobNumber;
  String? jobName;
  double? hours;
  double? minutes;
  String? timePunched;
  String? date;
  double? earned;
  String? contactPersonName;
  String? contactPersonPhone;
  String? contactPersonEmail;
  String? startTime;
  dynamic userStartDate;
  String? jobStatus;
  String? startAddress;
  String? endAddress;
  String? completionDate;
  String? completionTime;
  dynamic userCompletionDate;
  String? whatIsTransported;
  String? escortStart;
  String? escortEnd;
  String? waitTimeInHour;
  String? waitTimeInMinutes;
  String? timeToEscortStartInHour;
  String? timeToEscortStartInMinutes;
  String? timeFromEscortEndInHour;
  String? timeFromEscortEndInMinute;
  String? potentialBridgeFee;
  String? potentialFerryFee;
  String? truckLicensePlate;


  factory MyDoneJob.fromJson(Map<String, dynamic> json) => MyDoneJob(
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
    completionDate: json["completion_date"],
    completionTime: json["completion_time"],
    userCompletionDate: json["user_completion_date"],
    whatIsTransported: json["what_is_transported"],
    escortStart: json["escort_start"],
    escortEnd: json["escort_end"],
    waitTimeInHour: json["waitTimeInHour"],
    waitTimeInMinutes: json["waitTimeInMinute"],
    timeToEscortStartInHour: json["timeToEscortStartInHour"],
    timeToEscortStartInMinutes: json["timeToEscortStartInMinute"],
    timeFromEscortEndInHour: json["timeFromEscortEndInHour"],
    timeFromEscortEndInMinute: json["timeFromEscortEndInMinute"],
    potentialBridgeFee: json["potentialBridgeFee"],
    potentialFerryFee: json["potentialFerryFee"],
    truckLicensePlate: json["truckLicensePlate"],


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
    "completion_date": completionDate,
    "completion_time": completionTime,
    "user_completion_date": userCompletionDate,
    "what_is_transported": whatIsTransported,
    "escort_start": escortStart,
    "escort_end": escortEnd,
    "waitTimeInHour": waitTimeInHour,
    "waitTimeInMinute": waitTimeInMinutes,
    "timeToEscortStartInHour": timeToEscortStartInHour,
    "timeToEscortStartInMinute": timeToEscortStartInMinutes,
    "timeFromEscortEndInHour": timeFromEscortEndInHour,
    "timeFromEscortEndInMinute": timeFromEscortEndInMinute,
    "potentialBridgeFee": potentialBridgeFee,
    "potentialFerryFee": potentialFerryFee,
    "truckLicensePlate": truckLicensePlate,
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


