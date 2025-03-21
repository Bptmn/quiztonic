// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizResultStruct extends FFFirebaseStruct {
  QuizResultStruct({
    int? totalQuestions,
    int? correctAnswers,
    int? completionTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalQuestions = totalQuestions,
        _correctAnswers = correctAnswers,
        _completionTime = completionTime,
        super(firestoreUtilData);

  // "totalQuestions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  set totalQuestions(int? val) => _totalQuestions = val;

  void incrementTotalQuestions(int amount) =>
      totalQuestions = totalQuestions + amount;

  bool hasTotalQuestions() => _totalQuestions != null;

  // "correctAnswers" field.
  int? _correctAnswers;
  int get correctAnswers => _correctAnswers ?? 0;
  set correctAnswers(int? val) => _correctAnswers = val;

  void incrementCorrectAnswers(int amount) =>
      correctAnswers = correctAnswers + amount;

  bool hasCorrectAnswers() => _correctAnswers != null;

  // "completionTime" field.
  int? _completionTime;
  int get completionTime => _completionTime ?? 0;
  set completionTime(int? val) => _completionTime = val;

  void incrementCompletionTime(int amount) =>
      completionTime = completionTime + amount;

  bool hasCompletionTime() => _completionTime != null;

  static QuizResultStruct fromMap(Map<String, dynamic> data) =>
      QuizResultStruct(
        totalQuestions: castToType<int>(data['totalQuestions']),
        correctAnswers: castToType<int>(data['correctAnswers']),
        completionTime: castToType<int>(data['completionTime']),
      );

  static QuizResultStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalQuestions': _totalQuestions,
        'correctAnswers': _correctAnswers,
        'completionTime': _completionTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalQuestions': serializeParam(
          _totalQuestions,
          ParamType.int,
        ),
        'correctAnswers': serializeParam(
          _correctAnswers,
          ParamType.int,
        ),
        'completionTime': serializeParam(
          _completionTime,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuizResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizResultStruct(
        totalQuestions: deserializeParam(
          data['totalQuestions'],
          ParamType.int,
          false,
        ),
        correctAnswers: deserializeParam(
          data['correctAnswers'],
          ParamType.int,
          false,
        ),
        completionTime: deserializeParam(
          data['completionTime'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuizResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizResultStruct &&
        totalQuestions == other.totalQuestions &&
        correctAnswers == other.correctAnswers &&
        completionTime == other.completionTime;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([totalQuestions, correctAnswers, completionTime]);
}

QuizResultStruct createQuizResultStruct({
  int? totalQuestions,
  int? correctAnswers,
  int? completionTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizResultStruct(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      completionTime: completionTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizResultStruct? updateQuizResultStruct(
  QuizResultStruct? quizResult, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizResult
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizResultStructData(
  Map<String, dynamic> firestoreData,
  QuizResultStruct? quizResult,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizResult == null) {
    return;
  }
  if (quizResult.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quizResult.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizResultData = getQuizResultFirestoreData(quizResult, forFieldValue);
  final nestedData = quizResultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quizResult.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizResultFirestoreData(
  QuizResultStruct? quizResult, [
  bool forFieldValue = false,
]) {
  if (quizResult == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizResult.toMap());

  // Add any Firestore field values
  quizResult.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizResultListFirestoreData(
  List<QuizResultStruct>? quizResults,
) =>
    quizResults?.map((e) => getQuizResultFirestoreData(e, true)).toList() ?? [];
