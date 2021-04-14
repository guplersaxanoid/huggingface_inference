import 'package:huggingface_inference/src/outputs/output.dart';

class TableQuestionAnsweringOutput extends Output {
  String answer;
  List<List<int>> coordinates;
  List<dynamic> cells;
  String aggregator;

  TableQuestionAnsweringOutput.fromJson(Map<String, dynamic> json)
      : this.answer = json['answer'],
        this.coordinates = json['coordinates'].cast<List<int>>(),
        this.cells = json['cells'],
        this.aggregator = json['aggregator'];
}
