import 'package:huggingface_inference/src/payloads/payload.dart';

class TableQuestionAnsweringPayload extends Payload {
  String query;
  Map<String, List<dynamic>>? table;
  bool useGpu;
  bool useCache;
  bool waitForModel;

  TableQuestionAnsweringPayload(
      {required this.query,
      this.table,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel,
      }
    };
    Map<String, dynamic> inputs = {'query': query};
    if (table != null) {
      inputs['table'] = table;
    }
    json['inputs'] = inputs;
    return json;
  }
}
