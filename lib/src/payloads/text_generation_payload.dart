import 'package:huggingface_inference/src/payloads/payload.dart';

class TextGenerationPayload extends Payload {
  String inputs;
  int? topK;
  int? topP;
  num temperature;
  num? repititionPenalty;
  int numReturnSequences;
  bool useGpu;
  bool useCache;
  bool waitForModel;

  TextGenerationPayload(
      {required this.inputs,
      this.topK,
      this.topP,
      this.temperature = 1.0,
      this.repititionPenalty,
      this.numReturnSequences = 1,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'inputs': inputs,
      'parameters': {
        'temperature': temperature,
        'num_return_sequences': numReturnSequences
      },
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel,
      }
    };
    if (topK != null) json['parameters']['top_k'] = topK;
    if (topP != null) json['parameters']['top_p'] = topP;
    if (repititionPenalty != null)
      json['parameters']['repitition_penalty'] = repititionPenalty;
    return json;
  }
}
