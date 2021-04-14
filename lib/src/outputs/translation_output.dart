import 'package:huggingface_inference/src/outputs/output.dart';

class TranslationOutput extends Output {
  String translationText;

  TranslationOutput.fromJson(Map<String, dynamic> json)
      : this.translationText = json['translation_text'];
}
