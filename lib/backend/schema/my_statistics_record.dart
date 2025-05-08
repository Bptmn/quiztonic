import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyStatisticsRecord extends FirestoreRecord {
  MyStatisticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nb_quiz_done" field.
  int? _nbQuizDone;
  int get nbQuizDone => _nbQuizDone ?? 0;
  bool hasNbQuizDone() => _nbQuizDone != null;

  // "nb_questions_done" field.
  int? _nbQuestionsDone;
  int get nbQuestionsDone => _nbQuestionsDone ?? 0;
  bool hasNbQuestionsDone() => _nbQuestionsDone != null;

  // "nb_correct_answers" field.
  int? _nbCorrectAnswers;
  int get nbCorrectAnswers => _nbCorrectAnswers ?? 0;
  bool hasNbCorrectAnswers() => _nbCorrectAnswers != null;

  // "total_time_spent_on_quiz" field.
  int? _totalTimeSpentOnQuiz;
  int get totalTimeSpentOnQuiz => _totalTimeSpentOnQuiz ?? 0;
  bool hasTotalTimeSpentOnQuiz() => _totalTimeSpentOnQuiz != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nbQuizDone = castToType<int>(snapshotData['nb_quiz_done']);
    _nbQuestionsDone = castToType<int>(snapshotData['nb_questions_done']);
    _nbCorrectAnswers = castToType<int>(snapshotData['nb_correct_answers']);
    _totalTimeSpentOnQuiz =
        castToType<int>(snapshotData['total_time_spent_on_quiz']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_statistics')
          : FirebaseFirestore.instance.collectionGroup('my_statistics');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_statistics').doc(id);

  static Stream<MyStatisticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyStatisticsRecord.fromSnapshot(s));

  static Future<MyStatisticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyStatisticsRecord.fromSnapshot(s));

  static MyStatisticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyStatisticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyStatisticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyStatisticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyStatisticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyStatisticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyStatisticsRecordData({
  int? nbQuizDone,
  int? nbQuestionsDone,
  int? nbCorrectAnswers,
  int? totalTimeSpentOnQuiz,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nb_quiz_done': nbQuizDone,
      'nb_questions_done': nbQuestionsDone,
      'nb_correct_answers': nbCorrectAnswers,
      'total_time_spent_on_quiz': totalTimeSpentOnQuiz,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyStatisticsRecordDocumentEquality
    implements Equality<MyStatisticsRecord> {
  const MyStatisticsRecordDocumentEquality();

  @override
  bool equals(MyStatisticsRecord? e1, MyStatisticsRecord? e2) {
    return e1?.nbQuizDone == e2?.nbQuizDone &&
        e1?.nbQuestionsDone == e2?.nbQuestionsDone &&
        e1?.nbCorrectAnswers == e2?.nbCorrectAnswers &&
        e1?.totalTimeSpentOnQuiz == e2?.totalTimeSpentOnQuiz;
  }

  @override
  int hash(MyStatisticsRecord? e) => const ListEquality().hash([
        e?.nbQuizDone,
        e?.nbQuestionsDone,
        e?.nbCorrectAnswers,
        e?.totalTimeSpentOnQuiz
      ]);

  @override
  bool isValidKey(Object? o) => o is MyStatisticsRecord;
}
