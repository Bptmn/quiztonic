import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyFoldersRecord extends FirestoreRecord {
  MyFoldersRecord._(
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

  // "udpated_at" field.
  DateTime? _udpatedAt;
  DateTime? get udpatedAt => _udpatedAt;
  bool hasUdpatedAt() => _udpatedAt != null;

  // "quiz_references" field.
  List<DocumentReference>? _quizReferences;
  List<DocumentReference> get quizReferences => _quizReferences ?? const [];
  bool hasQuizReferences() => _quizReferences != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _udpatedAt = snapshotData['udpated_at'] as DateTime?;
    _quizReferences = getDataList(snapshotData['quiz_references']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_folders')
          : FirebaseFirestore.instance.collectionGroup('my_folders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_folders').doc(id);

  static Stream<MyFoldersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyFoldersRecord.fromSnapshot(s));

  static Future<MyFoldersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyFoldersRecord.fromSnapshot(s));

  static MyFoldersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyFoldersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyFoldersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyFoldersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyFoldersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyFoldersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyFoldersRecordData({
  String? name,
  DateTime? createdAt,
  DateTime? udpatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_at': createdAt,
      'udpated_at': udpatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyFoldersRecordDocumentEquality implements Equality<MyFoldersRecord> {
  const MyFoldersRecordDocumentEquality();

  @override
  bool equals(MyFoldersRecord? e1, MyFoldersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.udpatedAt == e2?.udpatedAt &&
        listEquality.equals(e1?.quizReferences, e2?.quizReferences);
  }

  @override
  int hash(MyFoldersRecord? e) => const ListEquality()
      .hash([e?.name, e?.createdAt, e?.udpatedAt, e?.quizReferences]);

  @override
  bool isValidKey(Object? o) => o is MyFoldersRecord;
}
