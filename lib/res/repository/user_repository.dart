import 'package:provider_with_mvvm_app/res/services/network_api_service.dart';

class UserRepository {
  final NetworkApiService service = NetworkApiService();

  dynamic getUsers() async {
    final res = await service.getResponse('users');
    return res;
  }

  dynamic addUser(Map<String, String> body) async {
    final res = await service.postApiResponse('users', body);
    return res;
  }
}