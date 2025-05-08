import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyQuizRecord extends FirestoreRecord {
  MyQuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "nb_of_questions" field.
  int? _nbOfQuestions;
  int get nbOfQuestions => _nbOfQuestions ?? 0;
  bool hasNbOfQuestions() => _nbOfQuestions != null;

  // "nb_of_correct_answers" field.
  int? _nbOfCorrectAnswers;
  int get nbOfCorrectAnswers => _nbOfCorrectAnswers ?? 0;
  bool hasNbOfCorrectAnswers() => _nbOfCorrectAnswers != null;

  // "time_duration" field.
  int? _timeDuration;
  int get timeDuration => _timeDuration ?? 0;
  bool hasTimeDuration() => _timeDuration != null;

  // "question_cards" field.
  List<QuestionCardStruct>? _questionCards;
  List<QuestionCardStruct> get questionCards => _questionCards ?? const [];
  bool hasQuestionCards() => _questionCards != null;

  // "flashcards" field.
  List<FlashcardStruct>? _flashcards;
  List<FlashcardStruct> get flashcards => _flashcards ?? const [];
  bool hasFlashcards() => _flashcards != null;

  // "folder_reference" field.
  DocumentReference? _folderReference;
  DocumentReference? get folderReference => _folderReference;
  bool hasFolderReference() => _folderReference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _nbOfQuestions = castToType<int>(snapshotData['nb_of_questions']);
    _nbOfCorrectAnswers =
        castToType<int>(snapshotData['nb_of_correct_answers']);
    _timeDuration = castToType<int>(snapshotData['time_duration']);
    _questionCards = getStructList(
      snapshotData['question_cards'],
      QuestionCardStruct.fromMap,
    );
    _flashcards = getStructList(
      snapshotData['flashcards'],
      FlashcardStruct.fromMap,
    );
    _folderReference = snapshotData['folder_reference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_quiz')
          : FirebaseFirestore.instance.collectionGroup('my_quiz');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_quiz').doc(id);

  static Stream<MyQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyQuizRecord.fromSnapshot(s));

  static Future<MyQuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyQuizRecord.fromSnapshot(s));

  static MyQuizRecord fromSnapshot(DocumentSnapshot snapshot) => MyQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyQuizRecordData({
  String? name,
  DateTime? createdAt,
  int? nbOfQuestions,
  int? nbOfCorrectAnswers,
  int? timeDuration,
  DocumentReference? folderReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_at': createdAt,
      'nb_of_questions': nbOfQuestions,
      'nb_of_correct_answers': nbOfCorrectAnswers,
      'time_duration': timeDuration,
      'folder_reference': folderReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyQuizRecordDocumentEquality implements Equality<MyQuizRecord> {
  const MyQuizRecordDocumentEquality();

  @override
  bool equals(MyQuizRecord? e1, MyQuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.nbOfQuestions == e2?.nbOfQuestions &&
        e1?.nbOfCorrectAnswers == e2?.nbOfCorrectAnswers &&
        e1?.timeDuration == e2?.timeDuration &&
        listEquality.equals(e1?.questionCards, e2?.questionCards) &&
        listEquality.equals(e1?.flashcards, e2?.flashcards) &&
        e1?.folderReference == e2?.folderReference;
  }

  @override
  int hash(MyQuizRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createdAt,
        e?.nbOfQuestions,
        e?.nbOfCorrectAnswers,
        e?.timeDuration,
        e?.questionCards,
        e?.flashcards,
        e?.folderReference
      ]);

  @override
  bool isValidKey(Object? o) => o is MyQuizRecord;
}
