import 'dart:convert';
import 'dart:math';

import 'package:api_calling_provider/provider/model/user_model.dart';

import 'package:http/http.dart' as http;

class DataUtils {
  Future<List<UserModel>> getData() async {
    List<UserModel> userData = [];

    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userData.add(userModel);
        });
        return userData;
      } else {
        return [];
      }
    } catch (o) {
      throw e;
    }
  }
}
