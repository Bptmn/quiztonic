import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoldersRecord extends FirestoreRecord {
  FoldersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "QuizRefs" field.
  List<DocumentReference>? _quizRefs;
  List<DocumentReference> get quizRefs => _quizRefs ?? const [];
  bool hasQuizRefs() => _quizRefs != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _quizRefs = getDataList(snapshotData['QuizRefs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('folders');

  static Stream<FoldersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoldersRecord.fromSnapshot(s));

  static Future<FoldersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoldersRecord.fromSnapshot(s));

  static FoldersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoldersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoldersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoldersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoldersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoldersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoldersRecordData({
  DocumentReference? userRef,
  String? name,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoldersRecordDocumentEquality implements Equality<FoldersRecord> {
  const FoldersRecordDocumentEquality();

  @override
  bool equals(FoldersRecord? e1, FoldersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.quizRefs, e2?.quizRefs);
  }

  @override
  int hash(FoldersRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.name, e?.createdAt, e?.updatedAt, e?.quizRefs]);

  @override
  bool isValidKey(Object? o) => o is FoldersRecord;
}
