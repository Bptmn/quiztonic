// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeneratedQuizzStruct extends FFFirebaseStruct {
  GeneratedQuizzStruct({
    String? quizName,
    List<QuestionCardStruct>? questionCards,
    List<FlashcardStruct>? flashcards,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quizName = quizName,
        _questionCards = questionCards,
        _flashcards = flashcards,
        super(firestoreUtilData);

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

  // "flashcards" field.
  List<FlashcardStruct>? _flashcards;
  List<FlashcardStruct> get flashcards => _flashcards ?? const [];
  set flashcards(List<FlashcardStruct>? val) => _flashcards = val;

  void updateFlashcards(Function(List<FlashcardStruct>) updateFn) {
    updateFn(_flashcards ??= []);
  }

  bool hasFlashcards() => _flashcards != null;

  static GeneratedQuizzStruct fromMap(Map<String, dynamic> data) =>
      GeneratedQuizzStruct(
        quizName: data['quizName'] as String?,
        questionCards: getStructList(
          data['questionCards'],
          QuestionCardStruct.fromMap,
        ),
        flashcards: getStructList(
          data['flashcards'],
          FlashcardStruct.fromMap,
        ),
      );

  static GeneratedQuizzStruct? maybeFromMap(dynamic data) => data is Map
      ? GeneratedQuizzStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quizName': _quizName,
        'questionCards': _questionCards?.map((e) => e.toMap()).toList(),
        'flashcards': _flashcards?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quizName': serializeParam(
          _quizName,
          ParamType.String,
        ),
        'questionCards': serializeParam(
          _questionCards,
          ParamType.DataStruct,
          isList: true,
        ),
        'flashcards': serializeParam(
          _flashcards,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GeneratedQuizzStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeneratedQuizzStruct(
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
        flashcards: deserializeStructParam<FlashcardStruct>(
          data['flashcards'],
          ParamType.DataStruct,
          true,
          structBuilder: FlashcardStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GeneratedQuizzStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GeneratedQuizzStruct &&
        quizName == other.quizName &&
        listEquality.equals(questionCards, other.questionCards) &&
        listEquality.equals(flashcards, other.flashcards);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quizName, questionCards, flashcards]);
}

GeneratedQuizzStruct createGeneratedQuizzStruct({
  String? quizName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeneratedQuizzStruct(
      quizName: quizName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeneratedQuizzStruct? updateGeneratedQuizzStruct(
  GeneratedQuizzStruct? generatedQuizz, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    generatedQuizz
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeneratedQuizzStructData(
  Map<String, dynamic> firestoreData,
  GeneratedQuizzStruct? generatedQuizz,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (generatedQuizz == null) {
    return;
  }
  if (generatedQuizz.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && generatedQuizz.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final generatedQuizzData =
      getGeneratedQuizzFirestoreData(generatedQuizz, forFieldValue);
  final nestedData =
      generatedQuizzData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = generatedQuizz.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeneratedQuizzFirestoreData(
  GeneratedQuizzStruct? generatedQuizz, [
  bool forFieldValue = false,
]) {
  if (generatedQuizz == null) {
    return {};
  }
  final firestoreData = mapToFirestore(generatedQuizz.toMap());

  // Add any Firestore field values
  generatedQuizz.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeneratedQuizzListFirestoreData(
  List<GeneratedQuizzStruct>? generatedQuizzs,
) =>
    generatedQuizzs
        ?.map((e) => getGeneratedQuizzFirestoreData(e, true))
        .toList() ??
    [];
