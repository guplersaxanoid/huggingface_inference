import 'dart:convert';

import 'package:huggingface_inference/src/payloads/payload.dart';

class ConversationalPayload extends Payload {
  String text;
  List<String>? generatedResponses;
  List<String>? pastUserInputs;
  bool useGpu;
  bool useCache;
  bool waitForModel;
  ConversationalPayload(
      {required this.text,
      this.generatedResponses,
      this.pastUserInputs,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel
      }
    };
    Map<String, dynamic> inputs = {'text': text};
    if (generatedResponses != null)
      inputs['generated_responses'] = generatedResponses;
    if (pastUserInputs != null) inputs['past_user_inputs'] = pastUserInputs;
    json['inputs'] = jsonEncode(inputs);
    return json;
  }
}
