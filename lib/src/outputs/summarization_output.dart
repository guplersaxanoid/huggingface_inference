import 'package:huggingface_inference/src/outputs/output.dart';

class SummarizationOutput extends Output {
  String summarizationText;
  SummarizationOutput.fromJson(Map<String, dynamic> json)
      : this.summarizationText = json['summarization-text'];
}
