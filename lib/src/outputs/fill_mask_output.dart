import 'package:huggingface_inference/src/outputs/output.dart';

class FillMaskOutput extends Output {
  String sequence;
  num score;
  int token;
  String tokenStr;

  FillMaskOutput.fromJson(Map<String, dynamic> json)
      : this.sequence = json['sequence'],
        this.score = json['score'],
        this.token = json['token'],
        this.tokenStr = json['token_str'];
}
