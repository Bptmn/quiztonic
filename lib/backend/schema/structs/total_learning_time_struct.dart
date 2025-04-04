// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalLearningTimeStruct extends FFFirebaseStruct {
  TotalLearningTimeStruct({
    int? days,
    int? hours,
    int? minutes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _days = days,
        _hours = hours,
        _minutes = minutes,
        super(firestoreUtilData);

  // "days" field.
  int? _days;
  int get days => _days ?? 0;
  set days(int? val) => _days = val;

  void incrementDays(int amount) => days = days + amount;

  bool hasDays() => _days != null;

  // "hours" field.
  int? _hours;
  int get hours => _hours ?? 0;
  set hours(int? val) => _hours = val;

  void incrementHours(int amount) => hours = hours + amount;

  bool hasHours() => _hours != null;

  // "minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  set minutes(int? val) => _minutes = val;

  void incrementMinutes(int amount) => minutes = minutes + amount;

  bool hasMinutes() => _minutes != null;

  static TotalLearningTimeStruct fromMap(Map<String, dynamic> data) =>
      TotalLearningTimeStruct(
        days: castToType<int>(data['days']),
        hours: castToType<int>(data['hours']),
        minutes: castToType<int>(data['minutes']),
      );

  static TotalLearningTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? TotalLearningTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'days': _days,
        'hours': _hours,
        'minutes': _minutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.int,
        ),
        'hours': serializeParam(
          _hours,
          ParamType.int,
        ),
        'minutes': serializeParam(
          _minutes,
          ParamType.int,
        ),
      }.withoutNulls;

  static TotalLearningTimeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TotalLearningTimeStruct(
        days: deserializeParam(
          data['days'],
          ParamType.int,
          false,
        ),
        hours: deserializeParam(
          data['hours'],
          ParamType.int,
          false,
        ),
        minutes: deserializeParam(
          data['minutes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TotalLearningTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalLearningTimeStruct &&
        days == other.days &&
        hours == other.hours &&
        minutes == other.minutes;
  }

  @override
  int get hashCode => const ListEquality().hash([days, hours, minutes]);
}

TotalLearningTimeStruct createTotalLearningTimeStruct({
  int? days,
  int? hours,
  int? minutes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalLearningTimeStruct(
      days: days,
      hours: hours,
      minutes: minutes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalLearningTimeStruct? updateTotalLearningTimeStruct(
  TotalLearningTimeStruct? totalLearningTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    totalLearningTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalLearningTimeStructData(
  Map<String, dynamic> firestoreData,
  TotalLearningTimeStruct? totalLearningTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (totalLearningTime == null) {
    return;
  }
  if (totalLearningTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && totalLearningTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalLearningTimeData =
      getTotalLearningTimeFirestoreData(totalLearningTime, forFieldValue);
  final nestedData =
      totalLearningTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = totalLearningTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalLearningTimeFirestoreData(
  TotalLearningTimeStruct? totalLearningTime, [
  bool forFieldValue = false,
]) {
  if (totalLearningTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(totalLearningTime.toMap());

  // Add any Firestore field values
  totalLearningTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalLearningTimeListFirestoreData(
  List<TotalLearningTimeStruct>? totalLearningTimes,
) =>
    totalLearningTimes
        ?.map((e) => getTotalLearningTimeFirestoreData(e, true))
        .toList() ??
    [];
