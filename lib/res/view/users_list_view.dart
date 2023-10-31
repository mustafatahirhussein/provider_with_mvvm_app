import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_app/res/model/users_model.dart';
import 'package:provider_with_mvvm_app/res/view/add_user.dart';
import 'package:provider_with_mvvm_app/res/view/widgets/users_custom_widget_view.dart';
import 'package:provider_with_mvvm_app/res/view_model/users_view_model.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {

  late UsersViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState

    viewModel = Provider.of<UsersViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Consumer<UsersViewModel>(
        builder: (context, _, child) {
          return viewModel.isLoading ? const Center(child: CircularProgressIndicator(),) : ListView.separated(
            itemCount: viewModel.allUsers.length,
            itemBuilder: (context, i) {

              Users item = viewModel.allUsers[i];
              return UsersCustomWidgetView(item: item);
            },
            separatorBuilder: (context, i) => const SizedBox(height: 10),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUser()));
      }, label: Text("Add User")),
    );
  }
}
