import 'dart:convert';


import 'package:http/http.dart';




import '../../modelclass/mesSigninModelclass.dart';
import '../../modelclass/mesSignupModelclass.dart';
import 'api_client.dart';


class meskartApi{
  ApiClient apiClient = ApiClient();


  Future<MesSignupModelclass> getmeskart(String userName,String email,String phone,String password,) async {
    String trendingpath = '/auth/local/sign-up';
    var body = {
      "username":userName,
      "email":email,
      "password":password,
      "phone":phone,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSignupModelclass.fromJson(jsonDecode(response.body));
  }
  Future<MesSigninModelclass> getmessignin(String email,String password,) async {
    String trendingpath = '/auth/local/sign-in';
    var body = {
      "email":email,
      "password":password,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return MesSigninModelclass.fromJson(jsonDecode(response.body));
  }


}