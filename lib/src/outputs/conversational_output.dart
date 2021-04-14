import 'package:huggingface_inference/src/outputs/output.dart';

class ConversationalOutput extends Output {
  String generatedText;
  List<dynamic> pastUserInputs;
  List<dynamic> generatedResponses;
  ConversationalOutput.fromJson(Map<String, dynamic> json)
      : this.generatedText = json['generated_text'],
        this.pastUserInputs = json['conversation']['past_user_inputs'],
        this.generatedResponses = json['conversation']['generated_responses'];
}
