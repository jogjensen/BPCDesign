import 'dart:html';

import 'package:designbpc/jobpages/MyJobs/joblist_model.dart';
import 'package:designbpc/jobpages/NewJob/newJobs_model.dart';
import 'package:designbpc/jobpages/DoneJobs/donejobs_model.dart';
import 'package:designbpc/model/login_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  // API for login
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url =
        "https://api.bookpilotcar.com/api/account/login?email=${requestModel
        .email}&password=${requestModel.password}";
    final response = await http.post(
      Uri.parse(
        url,
      ),
      headers: {
        "UserAgent": "Android",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    );
    // print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      // used shared preferences to store login access token
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // used shared preferences for storing login user id
      SharedPreferences userPrefs = await SharedPreferences.getInstance();
      final responseJson = json.decode(response.body);
      var data = responseJson['data'];
      await prefs.setString('token', data['token']);
      await userPrefs.setString('userId', data['user_id']);

      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw (Exception);
    }
  }

  //API for logout
  Future logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences UserPrefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');

    String url =
        "http://api.bookpilotcar.com/api/account/logout?user_id=${userId}";
    final response = await http.post(
      Uri.parse(
          url
      ),
      headers: {
        "UserAgent": "Android"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return response;
        } else {
        throw (Exception);
        }
    }



// API for jobList
  Future<JobList> jobList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences UserPrefs = await SharedPreferences.getInstance();

    // getting user id from shared preferences
    String? userId = prefs.getString('userId');

    // getting token from shared preferences
    String? token = prefs.getString('token');
    String url =
        "http://api.bookpilotcar.com/api/pilotcar/joblist?user_id=${userId}";
    final response = await http.get(
      Uri.parse(
        url,
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "token": "$token"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      JobList jobList = jobListFromJson((response.body));
      // print(jobList.jobData?.jobs);
      return jobList;
    } else {
      throw (Exception);
    }
  }

// API for Pending jobs
  Future<PendingJob> pendingJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences UserPrefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    String? token = prefs.getString('token');
    String url =
        "http://api.bookpilotcar.com/api/pilotcar/pendingjobs?user_id=${userId}";
    final response = await http.get(
      Uri.parse(
        url,
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "token": "$token"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      PendingJob pendingJob = pendingJobFromJson((response.body));
      return pendingJob;
    } else {
      throw (Exception);
    }
  }


// API for Done jobs
  Future<DoneJob> doneJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences UserPrefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? token = prefs.getString('token');
    String url =
        "http://api.bookpilotcar.com/api/pilotcar/completedjobs?user_id=${userId}";
    final response = await http.get(
      Uri.parse(
        url,
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "token": "$token"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      DoneJob doneJob = doneJobFromJson((response.body));
      return doneJob;
    } else {
      throw (Exception);
    }
  }
}
