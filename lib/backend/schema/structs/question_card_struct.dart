// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionCardStruct extends FFFirebaseStruct {
  QuestionCardStruct({
    String? answerExplanation,
    int? questionAnswerIndex,
    List<String>? questionChoices,
    String? questionText,
    int? userSelectionIndex,
    bool? questionIsDone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answerExplanation = answerExplanation,
        _questionAnswerIndex = questionAnswerIndex,
        _questionChoices = questionChoices,
        _questionText = questionText,
        _userSelectionIndex = userSelectionIndex,
        _questionIsDone = questionIsDone,
        super(firestoreUtilData);

  // "answerExplanation" field.
  String? _answerExplanation;
  String get answerExplanation => _answerExplanation ?? '';
  set answerExplanation(String? val) => _answerExplanation = val;

  bool hasAnswerExplanation() => _answerExplanation != null;

  // "questionAnswerIndex" field.
  int? _questionAnswerIndex;
  int get questionAnswerIndex => _questionAnswerIndex ?? 0;
  set questionAnswerIndex(int? val) => _questionAnswerIndex = val;

  void incrementQuestionAnswerIndex(int amount) =>
      questionAnswerIndex = questionAnswerIndex + amount;

  bool hasQuestionAnswerIndex() => _questionAnswerIndex != null;

  // "questionChoices" field.
  List<String>? _questionChoices;
  List<String> get questionChoices => _questionChoices ?? const [];
  set questionChoices(List<String>? val) => _questionChoices = val;

  void updateQuestionChoices(Function(List<String>) updateFn) {
    updateFn(_questionChoices ??= []);
  }

  bool hasQuestionChoices() => _questionChoices != null;

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  set questionText(String? val) => _questionText = val;

  bool hasQuestionText() => _questionText != null;

  // "userSelectionIndex" field.
  int? _userSelectionIndex;
  int get userSelectionIndex => _userSelectionIndex ?? 0;
  set userSelectionIndex(int? val) => _userSelectionIndex = val;

  void incrementUserSelectionIndex(int amount) =>
      userSelectionIndex = userSelectionIndex + amount;

  bool hasUserSelectionIndex() => _userSelectionIndex != null;

  // "questionIsDone" field.
  bool? _questionIsDone;
  bool get questionIsDone => _questionIsDone ?? false;
  set questionIsDone(bool? val) => _questionIsDone = val;

  bool hasQuestionIsDone() => _questionIsDone != null;

  static QuestionCardStruct fromMap(Map<String, dynamic> data) =>
      QuestionCardStruct(
        answerExplanation: data['answerExplanation'] as String?,
        questionAnswerIndex: castToType<int>(data['questionAnswerIndex']),
        questionChoices: getDataList(data['questionChoices']),
        questionText: data['questionText'] as String?,
        userSelectionIndex: castToType<int>(data['userSelectionIndex']),
        questionIsDone: data['questionIsDone'] as bool?,
      );

  static QuestionCardStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'answerExplanation': _answerExplanation,
        'questionAnswerIndex': _questionAnswerIndex,
        'questionChoices': _questionChoices,
        'questionText': _questionText,
        'userSelectionIndex': _userSelectionIndex,
        'questionIsDone': _questionIsDone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answerExplanation': serializeParam(
          _answerExplanation,
          ParamType.String,
        ),
        'questionAnswerIndex': serializeParam(
          _questionAnswerIndex,
          ParamType.int,
        ),
        'questionChoices': serializeParam(
          _questionChoices,
          ParamType.String,
          isList: true,
        ),
        'questionText': serializeParam(
          _questionText,
          ParamType.String,
        ),
        'userSelectionIndex': serializeParam(
          _userSelectionIndex,
          ParamType.int,
        ),
        'questionIsDone': serializeParam(
          _questionIsDone,
          ParamType.bool,
        ),
      }.withoutNulls;

  static QuestionCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionCardStruct(
        answerExplanation: deserializeParam(
          data['answerExplanation'],
          ParamType.String,
          false,
        ),
        questionAnswerIndex: deserializeParam(
          data['questionAnswerIndex'],
          ParamType.int,
          false,
        ),
        questionChoices: deserializeParam<String>(
          data['questionChoices'],
          ParamType.String,
          true,
        ),
        questionText: deserializeParam(
          data['questionText'],
          ParamType.String,
          false,
        ),
        userSelectionIndex: deserializeParam(
          data['userSelectionIndex'],
          ParamType.int,
          false,
        ),
        questionIsDone: deserializeParam(
          data['questionIsDone'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'QuestionCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionCardStruct &&
        answerExplanation == other.answerExplanation &&
        questionAnswerIndex == other.questionAnswerIndex &&
        listEquality.equals(questionChoices, other.questionChoices) &&
        questionText == other.questionText &&
        userSelectionIndex == other.userSelectionIndex &&
        questionIsDone == other.questionIsDone;
  }

  @override
  int get hashCode => const ListEquality().hash([
        answerExplanation,
        questionAnswerIndex,
        questionChoices,
        questionText,
        userSelectionIndex,
        questionIsDone
      ]);
}

QuestionCardStruct createQuestionCardStruct({
  String? answerExplanation,
  int? questionAnswerIndex,
  String? questionText,
  int? userSelectionIndex,
  bool? questionIsDone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionCardStruct(
      answerExplanation: answerExplanation,
      questionAnswerIndex: questionAnswerIndex,
      questionText: questionText,
      userSelectionIndex: userSelectionIndex,
      questionIsDone: questionIsDone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionCardStruct? updateQuestionCardStruct(
  QuestionCardStruct? questionCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questionCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionCardStructData(
  Map<String, dynamic> firestoreData,
  QuestionCardStruct? questionCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questionCard == null) {
    return;
  }
  if (questionCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questionCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionCardData =
      getQuestionCardFirestoreData(questionCard, forFieldValue);
  final nestedData =
      questionCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questionCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionCardFirestoreData(
  QuestionCardStruct? questionCard, [
  bool forFieldValue = false,
]) {
  if (questionCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questionCard.toMap());

  // Add any Firestore field values
  questionCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionCardListFirestoreData(
  List<QuestionCardStruct>? questionCards,
) =>
    questionCards?.map((e) => getQuestionCardFirestoreData(e, true)).toList() ??
    [];
