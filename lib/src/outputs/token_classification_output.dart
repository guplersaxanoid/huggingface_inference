import 'package:huggingface_inference/src/outputs/output.dart';

class TokenClassificationOutput extends Output {
  String entityGroup;
  num score;
  String word;
  int start;
  int end;

  TokenClassificationOutput.fromJson(Map<String, dynamic> json)
      : this.entityGroup = json['entity_group'],
        this.score = json['score'],
        this.word = json['word'],
        this.start = json['start'],
        this.end = json['end'];
}
