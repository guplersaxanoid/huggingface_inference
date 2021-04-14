import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:huggingface_inference/src/payloads/payload.dart';
import 'package:huggingface_inference/src/resolvers/output_resolver.dart';

class Session {
  String apiToken;
  String modelID;

  Session({required this.apiToken, required this.modelID});

  Future<List<Object>> query(Payload payload) async {
    Uri endpoint = Uri.parse(
        "https://api-inference.huggingface.co/models/" + this.modelID);
    Map<String, String> headers = {"Authorization": "Bearer " + this.apiToken};
    print(jsonEncode(payload));
    http.Response response =
        await http.post(endpoint, body: jsonEncode(payload), headers: headers);
    print(jsonDecode(response.body));
    Object jsonBody = jsonDecode(response.body);
    if (jsonBody is List<dynamic>) {
      List<Object> outputs =
          ListOutputResolver(outputs: jsonBody).resolveOutput();
      return outputs;
    }
    ErrorResolver(error: jsonBody as Map<String, dynamic>).resolveError();
    return [];
  }
}
