import 'package:huggingface_inference/src/payloads/payload.dart';

class QuestionAnsweringPayload extends Payload {
  String question;
  String context;
  bool useGpu;
  bool useCache;
  bool waitForModel;

  QuestionAnsweringPayload(
      {required this.question,
      required this.context,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'inputs': {'question': question, 'context': context},
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel
      }
    };
    return json;
  }
}
