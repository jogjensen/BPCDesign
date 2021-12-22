class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"] ?? "",
  );
}

class Error {
  Error({
    this.message,
  });

  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    message: json["message"] ?? "",
  );
}

class LoginResponseModel {
  final Data? data;
  final Error error;

  LoginResponseModel({
    required this.data,
    required this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: Data.fromJson(json["data"] ?? {}),
      error: Error.fromJson(json["error"] ?? {}),
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
