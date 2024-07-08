import 'package:http/http.dart' as http;

class APIResult {
  final bool success;
  final String message;
  final http.Response? response;

  APIResult({required this.success, required this.message, this.response});
}
