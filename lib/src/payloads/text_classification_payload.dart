import 'package:huggingface_inference/src/payloads/payload.dart';

class TextClassificationPayload extends Payload {
  String inputs;
  bool useGpu;
  bool useCache;
  bool waitForModel;

  TextClassificationPayload(
      {required this.inputs,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'inputs': inputs,
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel
      }
    };
    return json;
  }
}
