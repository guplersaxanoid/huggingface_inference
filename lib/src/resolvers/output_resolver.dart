import 'package:huggingface_inference/src/outputs/conversational_output.dart';
import 'package:huggingface_inference/src/outputs/fill_mask_output.dart';
import 'package:huggingface_inference/src/outputs/question_answering_output.dart';
import 'package:huggingface_inference/src/outputs/summarization_output.dart';
import 'package:huggingface_inference/src/outputs/table_question_answering_output.dart';
import 'package:huggingface_inference/src/outputs/text_classification_output.dart';
import 'package:huggingface_inference/src/outputs/text_generation_output.dart';
import 'package:huggingface_inference/src/outputs/token_classification_output.dart';
import 'package:huggingface_inference/src/outputs/translation_output.dart';
import 'package:huggingface_inference/src/outputs/zero_shot_classification_output.dart';
import 'package:huggingface_inference/src/exceptions.dart';

class ListOutputResolver {
  List<dynamic> outputs;
  ListOutputResolver({required this.outputs});

  List<Object> resolveOutput() {
    List<Object> outputList = [];
    for (var json in outputs) {
      if (json is List<dynamic> && json[0].containsKey('label')) {
        outputList.add(TextClassificationOutput(json: json));
        continue;
      }
      if (json.containsKey('warning')) {
        for (String w in json['warning']) print('warning: ' + w);
      }
      if (json.containsKey('sequence') && json.containsKey('labels'))
        outputList.add(ZeroShotClassificationOutput.fromJson(json));
      else if (json.containsKey('translation_text'))
        outputList.add(TranslationOutput.fromJson(json));
      else if (json.containsKey('summarization_text'))
        outputList.add(SummarizationOutput.fromJson(json));
      else if (json.containsKey('conversation'))
        outputList.add(ConversationalOutput.fromJson(json));
      else if (json.containsKey('coordinates'))
        outputList.add(TableQuestionAnsweringOutput.fromJson(json));
      else if (json.containsKey('answer'))
        outputList.add(QuestionAnsweringOutput.fromJson(json));
      else if (json.containsKey('entity_group'))
        outputList.add(TokenClassificationOutput.fromJson(json));
      else if (json.containsKey('generated_text'))
        outputList.add(TextGenerationOutput.fromJson(json));
      else if (json.containsKey('sequence') && json.containsKey('token'))
        outputList.add(FillMaskOutput.fromJson(json));
      else
        throw Exception(json['error']);
    }
    return outputList;
  }
}

class ErrorResolver {
  Map<String, dynamic> error;
  ErrorResolver({required this.error});

  void resolveError() {
    if (error['error'].toString().contains('does not exist'))
      throw ModelNotFoundError(cause: error['error']);
    else if (error['error'].toString().contains('field required'))
      throw FieldNotFound(cause: error['error']);
    else if (error['error'].toString().contains('not allowed'))
      throw NotAllowedError(cause: error['error']);
    else if (error['error'].toString().contains('loading'))
      throw ModelLoadingError(cause: error['error']);
    else if (error['error'].toString().contains('wrong format'))
      throw WrongFormatError(cause: error['error']);
    else if (error['error'].toString().contains('Invalid input'))
      throw InvalidInputError(cause: error['error']);
    else
      throw UnknownError(cause: error['error']);
  }
}
