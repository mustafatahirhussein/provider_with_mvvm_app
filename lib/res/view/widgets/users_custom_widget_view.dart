import 'package:flutter/material.dart';
import 'package:provider_with_mvvm_app/res/model/users_model.dart';

class UsersCustomWidgetView extends StatelessWidget {
  const UsersCustomWidgetView({super.key, required this.item,});

  final Users item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(item.avatar, fit: BoxFit.cover,),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item.firstName} ${item.lastName}'),
            Text(item.email),
          ],
        ),
      ],
    );
  }
}
