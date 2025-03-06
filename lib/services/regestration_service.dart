import 'package:dio/dio.dart';
import 'package:shop_app_api/models/user_model.dart';

class RegisterService {
  static Dio dio = Dio();
  static Future<UserData> registerService({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio
          .post("https://elsewedyteam.runasp.net/api/Register/AddUser", data: { "Name":"fady",
        "Password":"Password123456",
        "Email":"fady@gmail.com",
        "Phone":"010262621205"});
      if (response.statusCode == 200) {
        return UserData.fetchUser(response.data);
      } else {
        throw "Issue with registration";
      }
    } catch (error) {
      throw "Registration error: $error";
    }
  }

  static Future<UserData> logService({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {"Email": "email", "Password": "password"};
      Response response =
          await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser", data: data);
      if (response.statusCode == 200) {
        return UserData.fetchUser(response.data);
      } else {
        throw "Issue with log in";
      }
    } catch (error) {
      throw "Log in error: $error";
    }
  }
}
