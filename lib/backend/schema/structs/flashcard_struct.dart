// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardStruct extends FFFirebaseStruct {
  FlashcardStruct({
    String? front,
    String? back,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _front = front,
        _back = back,
        super(firestoreUtilData);

  // "front" field.
  String? _front;
  String get front => _front ?? '';
  set front(String? val) => _front = val;

  bool hasFront() => _front != null;

  // "back" field.
  String? _back;
  String get back => _back ?? '';
  set back(String? val) => _back = val;

  bool hasBack() => _back != null;

  static FlashcardStruct fromMap(Map<String, dynamic> data) => FlashcardStruct(
        front: data['front'] as String?,
        back: data['back'] as String?,
      );

  static FlashcardStruct? maybeFromMap(dynamic data) => data is Map
      ? FlashcardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'front': _front,
        'back': _back,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'front': serializeParam(
          _front,
          ParamType.String,
        ),
        'back': serializeParam(
          _back,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlashcardStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlashcardStruct(
        front: deserializeParam(
          data['front'],
          ParamType.String,
          false,
        ),
        back: deserializeParam(
          data['back'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FlashcardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlashcardStruct &&
        front == other.front &&
        back == other.back;
  }

  @override
  int get hashCode => const ListEquality().hash([front, back]);
}

FlashcardStruct createFlashcardStruct({
  String? front,
  String? back,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlashcardStruct(
      front: front,
      back: back,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlashcardStruct? updateFlashcardStruct(
  FlashcardStruct? flashcard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flashcard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlashcardStructData(
  Map<String, dynamic> firestoreData,
  FlashcardStruct? flashcard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flashcard == null) {
    return;
  }
  if (flashcard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && flashcard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flashcardData = getFlashcardFirestoreData(flashcard, forFieldValue);
  final nestedData = flashcardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = flashcard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlashcardFirestoreData(
  FlashcardStruct? flashcard, [
  bool forFieldValue = false,
]) {
  if (flashcard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flashcard.toMap());

  // Add any Firestore field values
  flashcard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlashcardListFirestoreData(
  List<FlashcardStruct>? flashcards,
) =>
    flashcards?.map((e) => getFlashcardFirestoreData(e, true)).toList() ?? [];
