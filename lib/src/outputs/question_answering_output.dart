import 'package:huggingface_inference/src/outputs/output.dart';

class QuestionAnsweringOutput extends Output {
  String answer;
  num score;
  int start;
  int stop;

  QuestionAnsweringOutput.fromJson(Map<String, dynamic> json)
      : this.answer = json['answer'],
        this.score = json['score'],
        this.start = json['start'],
        this.stop = json['end'];
}
