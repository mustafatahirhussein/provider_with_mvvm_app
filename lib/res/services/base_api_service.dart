abstract class BaseApiService {

  dynamic getResponse(String url);

  dynamic postApiResponse(String url, Map<String, String> body, {Map<String, String>? headers});
}