// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionCardStruct extends BaseStruct {
  QuestionCardStruct({
    String? questionText,
    List<String>? questionChoices,
    int? questionAnswerIndex,
    String? answerExplanation,
  })  : _questionText = questionText,
        _questionChoices = questionChoices,
        _questionAnswerIndex = questionAnswerIndex,
        _answerExplanation = answerExplanation;

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  set questionText(String? val) => _questionText = val;

  bool hasQuestionText() => _questionText != null;

  // "questionChoices" field.
  List<String>? _questionChoices;
  List<String> get questionChoices => _questionChoices ?? const [];
  set questionChoices(List<String>? val) => _questionChoices = val;

  void updateQuestionChoices(Function(List<String>) updateFn) {
    updateFn(_questionChoices ??= []);
  }

  bool hasQuestionChoices() => _questionChoices != null;

  // "questionAnswerIndex" field.
  int? _questionAnswerIndex;
  int get questionAnswerIndex => _questionAnswerIndex ?? 0;
  set questionAnswerIndex(int? val) => _questionAnswerIndex = val;

  void incrementQuestionAnswerIndex(int amount) =>
      questionAnswerIndex = questionAnswerIndex + amount;

  bool hasQuestionAnswerIndex() => _questionAnswerIndex != null;

  // "answerExplanation" field.
  String? _answerExplanation;
  String get answerExplanation => _answerExplanation ?? '';
  set answerExplanation(String? val) => _answerExplanation = val;

  bool hasAnswerExplanation() => _answerExplanation != null;

  static QuestionCardStruct fromMap(Map<String, dynamic> data) =>
      QuestionCardStruct(
        questionText: data['questionText'] as String?,
        questionChoices: getDataList(data['questionChoices']),
        questionAnswerIndex: castToType<int>(data['questionAnswerIndex']),
        answerExplanation: data['answerExplanation'] as String?,
      );

  static QuestionCardStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'questionText': _questionText,
        'questionChoices': _questionChoices,
        'questionAnswerIndex': _questionAnswerIndex,
        'answerExplanation': _answerExplanation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionText': serializeParam(
          _questionText,
          ParamType.String,
        ),
        'questionChoices': serializeParam(
          _questionChoices,
          ParamType.String,
          isList: true,
        ),
        'questionAnswerIndex': serializeParam(
          _questionAnswerIndex,
          ParamType.int,
        ),
        'answerExplanation': serializeParam(
          _answerExplanation,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionCardStruct(
        questionText: deserializeParam(
          data['questionText'],
          ParamType.String,
          false,
        ),
        questionChoices: deserializeParam<String>(
          data['questionChoices'],
          ParamType.String,
          true,
        ),
        questionAnswerIndex: deserializeParam(
          data['questionAnswerIndex'],
          ParamType.int,
          false,
        ),
        answerExplanation: deserializeParam(
          data['answerExplanation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionCardStruct &&
        questionText == other.questionText &&
        listEquality.equals(questionChoices, other.questionChoices) &&
        questionAnswerIndex == other.questionAnswerIndex &&
        answerExplanation == other.answerExplanation;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [questionText, questionChoices, questionAnswerIndex, answerExplanation]);
}

QuestionCardStruct createQuestionCardStruct({
  String? questionText,
  int? questionAnswerIndex,
  String? answerExplanation,
}) =>
    QuestionCardStruct(
      questionText: questionText,
      questionAnswerIndex: questionAnswerIndex,
      answerExplanation: answerExplanation,
    );
