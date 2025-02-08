// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeneratedQuizzStruct extends BaseStruct {
  GeneratedQuizzStruct({
    String? id,
    String? quizName,
    List<QuestionCardStruct>? questionCards,
  })  : _id = id,
        _quizName = quizName,
        _questionCards = questionCards;

  // "id" field.
  String? _id;
  String get id => _id ?? 'X';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "quizName" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  set quizName(String? val) => _quizName = val;

  bool hasQuizName() => _quizName != null;

  // "questionCards" field.
  List<QuestionCardStruct>? _questionCards;
  List<QuestionCardStruct> get questionCards => _questionCards ?? const [];
  set questionCards(List<QuestionCardStruct>? val) => _questionCards = val;

  void updateQuestionCards(Function(List<QuestionCardStruct>) updateFn) {
    updateFn(_questionCards ??= []);
  }

  bool hasQuestionCards() => _questionCards != null;

  static GeneratedQuizzStruct fromMap(Map<String, dynamic> data) =>
      GeneratedQuizzStruct(
        id: data['id'] as String?,
        quizName: data['quizName'] as String?,
        questionCards: getStructList(
          data['questionCards'],
          QuestionCardStruct.fromMap,
        ),
      );

  static GeneratedQuizzStruct? maybeFromMap(dynamic data) => data is Map
      ? GeneratedQuizzStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'quizName': _quizName,
        'questionCards': _questionCards?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'quizName': serializeParam(
          _quizName,
          ParamType.String,
        ),
        'questionCards': serializeParam(
          _questionCards,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GeneratedQuizzStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeneratedQuizzStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        quizName: deserializeParam(
          data['quizName'],
          ParamType.String,
          false,
        ),
        questionCards: deserializeStructParam<QuestionCardStruct>(
          data['questionCards'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionCardStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GeneratedQuizzStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GeneratedQuizzStruct &&
        id == other.id &&
        quizName == other.quizName &&
        listEquality.equals(questionCards, other.questionCards);
  }

  @override
  int get hashCode => const ListEquality().hash([id, quizName, questionCards]);
}

GeneratedQuizzStruct createGeneratedQuizzStruct({
  String? id,
  String? quizName,
}) =>
    GeneratedQuizzStruct(
      id: id,
      quizName: quizName,
    );
