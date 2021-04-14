import 'package:huggingface_inference/src/outputs/output.dart';

class TextGenerationOutput extends Output {
  String generatedText;
  TextGenerationOutput.fromJson(Map<String, dynamic> json)
      : this.generatedText = json['generated_text'];
}
