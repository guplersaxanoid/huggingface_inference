import 'package:huggingface_inference/src/outputs/output.dart';

class ZeroShotClassificationOutput extends Output {
  String sequence;
  List<String> labels;
  List<num> scores;

  ZeroShotClassificationOutput.fromJson(Map<String, dynamic> json)
      : this.sequence = json['sequence'],
        this.labels = json['labels'],
        this.scores = json['scores'];
}
