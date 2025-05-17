import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MySubscriptionRecord extends FirestoreRecord {
  MySubscriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creditCount" field.
  int? _creditCount;
  int get creditCount => _creditCount ?? 0;
  bool hasCreditCount() => _creditCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creditCount = castToType<int>(snapshotData['creditCount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_subscription')
          : FirebaseFirestore.instance.collectionGroup('my_subscription');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('my_subscription').doc(id);

  static Stream<MySubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MySubscriptionRecord.fromSnapshot(s));

  static Future<MySubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MySubscriptionRecord.fromSnapshot(s));

  static MySubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MySubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MySubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MySubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MySubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MySubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMySubscriptionRecordData({
  int? creditCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creditCount': creditCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class MySubscriptionRecordDocumentEquality
    implements Equality<MySubscriptionRecord> {
  const MySubscriptionRecordDocumentEquality();

  @override
  bool equals(MySubscriptionRecord? e1, MySubscriptionRecord? e2) {
    return e1?.creditCount == e2?.creditCount;
  }

  @override
  int hash(MySubscriptionRecord? e) =>
      const ListEquality().hash([e?.creditCount]);

  @override
  bool isValidKey(Object? o) => o is MySubscriptionRecord;
}
