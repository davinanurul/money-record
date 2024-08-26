import 'package:davina_money_record/config/api.dart';
import 'package:davina_money_record/config/app_request.dart';

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      //jika login berhasil simpan data user ke session
      //var mapUser = responseBody['data];
      //Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, {
      'name': name,
      'email': email,
      'password': password,
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      //jika login berhasil simpan data user ke session
      //var mapUser = responseBody['data];
      //Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }
}
