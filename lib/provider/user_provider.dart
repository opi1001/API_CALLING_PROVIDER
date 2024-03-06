import 'package:api_calling_provider/data_utils/data_utils.dart';
import 'package:api_calling_provider/provider/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late List<UserModel> _userList = [];

  List<UserModel> get allUserList => _userList;
  bool isLoading = false;

  void fetchPost() async {
    isLoading = false;
    try {
      DataUtils dataUtils = DataUtils();
      _userList = await dataUtils.getData();
      isLoading = false;
    } catch (o) {
      isLoading = false;
    }
    notifyListeners();
  }
}
