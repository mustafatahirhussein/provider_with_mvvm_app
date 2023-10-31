import 'dart:convert';
import 'dart:io';
import 'package:provider_with_mvvm_app/res/services/app_exceptions.dart';
import 'package:provider_with_mvvm_app/res/services/base_api_service.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://reqres.in/";
String prefix = "api/";

class NetworkApiService extends BaseApiService {

  @override
  dynamic getResponse(String url) async {
    dynamic jsonResponse;

    try {
      final http.Response res = await http.get(
          Uri.parse(baseUrl + prefix + url));
      jsonResponse = jsonOutput(res);
    }
    on SocketException {
      throw FetchDataException("No Internet found");
    }

    return jsonResponse;
  }

  @override
  dynamic postApiResponse(String url, Map<String, String> body,
      {Map<String, String>? headers}) async {
    dynamic jsonResponse;

    try {
      final res = await http.post(Uri.parse(baseUrl + prefix +
          url), body: body, headers: headers);

      jsonResponse = res.body;
    }
    on SocketException {
      throw FetchDataException("No Internet found");
    }
    return jsonResponse;
  }

  dynamic jsonOutput(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic res = jsonDecode(response.body);
        return res;
      case 500:
        throw FetchDataException("Internal server error ${response.body}");
      default:
        throw BadRequestException("Bad request ${response.body}");
    }
  }
}