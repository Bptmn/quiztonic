import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedQuizRecord extends FirestoreRecord {
  SavedQuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizRef" field.
  DocumentReference? _quizRef;
  DocumentReference? get quizRef => _quizRef;
  bool hasQuizRef() => _quizRef != null;

  // "quizName" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "totalQuestions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  bool hasTotalQuestions() => _totalQuestions != null;

  // "totalCorrectAnswers" field.
  int? _totalCorrectAnswers;
  int get totalCorrectAnswers => _totalCorrectAnswers ?? 0;
  bool hasTotalCorrectAnswers() => _totalCorrectAnswers != null;

  // "timeDuration" field.
  int? _timeDuration;
  int get timeDuration => _timeDuration ?? 0;
  bool hasTimeDuration() => _timeDuration != null;

  // "questionCards" field.
  List<QuestionCardStruct>? _questionCards;
  List<QuestionCardStruct> get questionCards => _questionCards ?? const [];
  bool hasQuestionCards() => _questionCards != null;

  // "difficultyLevel" field.
  int? _difficultyLevel;
  int get difficultyLevel => _difficultyLevel ?? 0;
  bool hasDifficultyLevel() => _difficultyLevel != null;

  // "sourceType" field.
  String? _sourceType;
  String get sourceType => _sourceType ?? '';
  bool hasSourceType() => _sourceType != null;

  // "sourceInput" field.
  String? _sourceInput;
  String get sourceInput => _sourceInput ?? '';
  bool hasSourceInput() => _sourceInput != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "flashcards" field.
  List<FlashcardStruct>? _flashcards;
  List<FlashcardStruct> get flashcards => _flashcards ?? const [];
  bool hasFlashcards() => _flashcards != null;

  void _initializeFields() {
    _quizRef = snapshotData['quizRef'] as DocumentReference?;
    _quizName = snapshotData['quizName'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _totalQuestions = castToType<int>(snapshotData['totalQuestions']);
    _totalCorrectAnswers = castToType<int>(snapshotData['totalCorrectAnswers']);
    _timeDuration = castToType<int>(snapshotData['timeDuration']);
    _questionCards = getStructList(
      snapshotData['questionCards'],
      QuestionCardStruct.fromMap,
    );
    _difficultyLevel = castToType<int>(snapshotData['difficultyLevel']);
    _sourceType = snapshotData['sourceType'] as String?;
    _sourceInput = snapshotData['sourceInput'] as String?;
    _category = snapshotData['category'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _flashcards = getStructList(
      snapshotData['flashcards'],
      FlashcardStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('savedQuiz');

  static Stream<SavedQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedQuizRecord.fromSnapshot(s));

  static Future<SavedQuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedQuizRecord.fromSnapshot(s));

  static SavedQuizRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedQuizRecordData({
  DocumentReference? quizRef,
  String? quizName,
  DateTime? createdAt,
  int? totalQuestions,
  int? totalCorrectAnswers,
  int? timeDuration,
  int? difficultyLevel,
  String? sourceType,
  String? sourceInput,
  String? category,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizRef': quizRef,
      'quizName': quizName,
      'createdAt': createdAt,
      'totalQuestions': totalQuestions,
      'totalCorrectAnswers': totalCorrectAnswers,
      'timeDuration': timeDuration,
      'difficultyLevel': difficultyLevel,
      'sourceType': sourceType,
      'sourceInput': sourceInput,
      'category': category,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedQuizRecordDocumentEquality implements Equality<SavedQuizRecord> {
  const SavedQuizRecordDocumentEquality();

  @override
  bool equals(SavedQuizRecord? e1, SavedQuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quizRef == e2?.quizRef &&
        e1?.quizName == e2?.quizName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.totalQuestions == e2?.totalQuestions &&
        e1?.totalCorrectAnswers == e2?.totalCorrectAnswers &&
        e1?.timeDuration == e2?.timeDuration &&
        listEquality.equals(e1?.questionCards, e2?.questionCards) &&
        e1?.difficultyLevel == e2?.difficultyLevel &&
        e1?.sourceType == e2?.sourceType &&
        e1?.sourceInput == e2?.sourceInput &&
        e1?.category == e2?.category &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.flashcards, e2?.flashcards);
  }

  @override
  int hash(SavedQuizRecord? e) => const ListEquality().hash([
        e?.quizRef,
        e?.quizName,
        e?.createdAt,
        e?.totalQuestions,
        e?.totalCorrectAnswers,
        e?.timeDuration,
        e?.questionCards,
        e?.difficultyLevel,
        e?.sourceType,
        e?.sourceInput,
        e?.category,
        e?.userRef,
        e?.flashcards
      ]);

  @override
  bool isValidKey(Object? o) => o is SavedQuizRecord;
}
