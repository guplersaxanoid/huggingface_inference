import 'package:huggingface_inference/src/payloads/payload.dart';

class ZeroShotClassificationPayload extends Payload {
  String inputs;
  List<String> candidateLabels;
  bool multiLabel;
  bool useGpu;
  bool useCache;
  bool waitForModel;
  ZeroShotClassificationPayload(
      {required this.inputs,
      required this.candidateLabels,
      this.multiLabel = false,
      this.useGpu = false,
      this.useCache = true,
      this.waitForModel = false});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'inputs': inputs,
      'parameters': {
        'candidate_labels': candidateLabels,
        'multi_label': multiLabel
      },
      'options': {
        'use_gpu': useGpu,
        'use_cache': useCache,
        'wait_for_model': waitForModel
      }
    };
    return json;
  }
}
