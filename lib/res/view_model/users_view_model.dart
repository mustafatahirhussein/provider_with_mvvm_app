// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider_with_mvvm_app/res/model/users_model.dart';
import 'package:provider_with_mvvm_app/res/repository/user_repository.dart';

class UsersViewModel extends ChangeNotifier {
  
  UsersViewModel(this.userRepository);
  final UserRepository userRepository;
  
  List<Users> allUsers = [];
  bool isLoading = false;
  
  Future<void> getUsers() async {
    isLoading = true;
    notifyListeners();

    dynamic res = await userRepository.getUsers();

    final users = UsersModel.fromJson(res);
    allUsers = users.users;

    isLoading = false;
    notifyListeners();
  }

  addUser(BuildContext context, Map<String, String> body) async {
    isLoading = true;
    notifyListeners();

    await userRepository.addUser(body);

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Added")));
    getUsers();

    isLoading = false;
    notifyListeners();
  }
  
}