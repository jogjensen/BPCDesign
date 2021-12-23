import 'package:designbpc/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url =
        "https://api.bookpilotcar.com/api/account/login?email=${requestModel.email}&password=${requestModel.password}";
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
      print(response.body);
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw (Exception);
    }
  }
}

