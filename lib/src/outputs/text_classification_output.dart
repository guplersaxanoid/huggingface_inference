import 'package:huggingface_inference/src/outputs/output.dart';

class TextClassificationOutput extends Output {
  List<Map<String, dynamic>> scores = [];
  TextClassificationOutput({required List<dynamic> json}) {
    for (var j in json) {
      scores.add({'label': j['label'], 'scores': j['score']});
    }
  }
}
