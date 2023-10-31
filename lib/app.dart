import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_app/res/repository/user_repository.dart';
import 'package:provider_with_mvvm_app/res/view/users_list_view.dart';
import 'package:provider_with_mvvm_app/res/view_model/users_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersViewModel(UserRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UsersListView(),
      ),
    );
  }
}
