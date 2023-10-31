import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_app/res/view_model/users_view_model.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  TextEditingController _username = TextEditingController();
  TextEditingController _job = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UsersViewModel viewModel = Provider.of<UsersViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            TextFormField(
              controller: _username,
              decoration: const InputDecoration(
                hintText: 'Username'
              ),
            ),

            TextFormField(
              controller: _job,
              decoration: const InputDecoration(
                  hintText: 'Job'
              ),
            ),

            const Spacer(),

            viewModel.isLoading ? const Center(child: CircularProgressIndicator()) : ElevatedButton(
              child: const Text("Add User"),
              onPressed: () {

                Map<String, String> body = {
                  "name": _username.text,
                  "job": _job.text,
                };

                viewModel.addUser(context, body);
              },
            )
          ],
        ),
      ),
    );
  }
}
