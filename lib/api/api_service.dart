import 'package:designbpc/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://api.bookpilotcar.com/api/account/login";

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200 || response.statusCode == 400) {
      print(response);
      return LoginResponseModel.fromJson(json.decode(response.body));

    }
    else {
      throw Exception('Failed to load data');
    }
  }
}