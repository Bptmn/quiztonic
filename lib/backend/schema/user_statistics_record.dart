import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStatisticsRecord extends FirestoreRecord {
  UserStatisticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

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

  // "total_time_spent_on_flashcards" field.
  int? _totalTimeSpentOnFlashcards;
  int get totalTimeSpentOnFlashcards => _totalTimeSpentOnFlashcards ?? 0;
  bool hasTotalTimeSpentOnFlashcards() => _totalTimeSpentOnFlashcards != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _nbQuizDone = castToType<int>(snapshotData['nb_quiz_done']);
    _nbQuestionsDone = castToType<int>(snapshotData['nb_questions_done']);
    _nbCorrectAnswers = castToType<int>(snapshotData['nb_correct_answers']);
    _totalTimeSpentOnQuiz =
        castToType<int>(snapshotData['total_time_spent_on_quiz']);
    _totalTimeSpentOnFlashcards =
        castToType<int>(snapshotData['total_time_spent_on_flashcards']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userStatistics');

  static Stream<UserStatisticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserStatisticsRecord.fromSnapshot(s));

  static Future<UserStatisticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserStatisticsRecord.fromSnapshot(s));

  static UserStatisticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserStatisticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserStatisticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserStatisticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserStatisticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserStatisticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserStatisticsRecordData({
  DocumentReference? userRef,
  int? nbQuizDone,
  int? nbQuestionsDone,
  int? nbCorrectAnswers,
  int? totalTimeSpentOnQuiz,
  int? totalTimeSpentOnFlashcards,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'nb_quiz_done': nbQuizDone,
      'nb_questions_done': nbQuestionsDone,
      'nb_correct_answers': nbCorrectAnswers,
      'total_time_spent_on_quiz': totalTimeSpentOnQuiz,
      'total_time_spent_on_flashcards': totalTimeSpentOnFlashcards,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserStatisticsRecordDocumentEquality
    implements Equality<UserStatisticsRecord> {
  const UserStatisticsRecordDocumentEquality();

  @override
  bool equals(UserStatisticsRecord? e1, UserStatisticsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.nbQuizDone == e2?.nbQuizDone &&
        e1?.nbQuestionsDone == e2?.nbQuestionsDone &&
        e1?.nbCorrectAnswers == e2?.nbCorrectAnswers &&
        e1?.totalTimeSpentOnQuiz == e2?.totalTimeSpentOnQuiz &&
        e1?.totalTimeSpentOnFlashcards == e2?.totalTimeSpentOnFlashcards;
  }

  @override
  int hash(UserStatisticsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.nbQuizDone,
        e?.nbQuestionsDone,
        e?.nbCorrectAnswers,
        e?.totalTimeSpentOnQuiz,
        e?.totalTimeSpentOnFlashcards
      ]);

  @override
  bool isValidKey(Object? o) => o is UserStatisticsRecord;
}
