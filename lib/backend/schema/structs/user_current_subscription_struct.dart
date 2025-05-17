// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCurrentSubscriptionStruct extends FFFirebaseStruct {
  UserCurrentSubscriptionStruct({
    String? productId,
    DateTime? purchaseDate,
    DateTime? renewalDate,
    String? store,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _purchaseDate = purchaseDate,
        _renewalDate = renewalDate,
        _store = store,
        super(firestoreUtilData);

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "purchaseDate" field.
  DateTime? _purchaseDate;
  DateTime? get purchaseDate => _purchaseDate;
  set purchaseDate(DateTime? val) => _purchaseDate = val;

  bool hasPurchaseDate() => _purchaseDate != null;

  // "renewalDate" field.
  DateTime? _renewalDate;
  DateTime? get renewalDate => _renewalDate;
  set renewalDate(DateTime? val) => _renewalDate = val;

  bool hasRenewalDate() => _renewalDate != null;

  // "store" field.
  String? _store;
  String get store => _store ?? '';
  set store(String? val) => _store = val;

  bool hasStore() => _store != null;

  static UserCurrentSubscriptionStruct fromMap(Map<String, dynamic> data) =>
      UserCurrentSubscriptionStruct(
        productId: data['productId'] as String?,
        purchaseDate: data['purchaseDate'] as DateTime?,
        renewalDate: data['renewalDate'] as DateTime?,
        store: data['store'] as String?,
      );

  static UserCurrentSubscriptionStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? UserCurrentSubscriptionStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'productId': _productId,
        'purchaseDate': _purchaseDate,
        'renewalDate': _renewalDate,
        'store': _store,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'purchaseDate': serializeParam(
          _purchaseDate,
          ParamType.DateTime,
        ),
        'renewalDate': serializeParam(
          _renewalDate,
          ParamType.DateTime,
        ),
        'store': serializeParam(
          _store,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserCurrentSubscriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserCurrentSubscriptionStruct(
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        purchaseDate: deserializeParam(
          data['purchaseDate'],
          ParamType.DateTime,
          false,
        ),
        renewalDate: deserializeParam(
          data['renewalDate'],
          ParamType.DateTime,
          false,
        ),
        store: deserializeParam(
          data['store'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserCurrentSubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCurrentSubscriptionStruct &&
        productId == other.productId &&
        purchaseDate == other.purchaseDate &&
        renewalDate == other.renewalDate &&
        store == other.store;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productId, purchaseDate, renewalDate, store]);
}

UserCurrentSubscriptionStruct createUserCurrentSubscriptionStruct({
  String? productId,
  DateTime? purchaseDate,
  DateTime? renewalDate,
  String? store,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCurrentSubscriptionStruct(
      productId: productId,
      purchaseDate: purchaseDate,
      renewalDate: renewalDate,
      store: store,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCurrentSubscriptionStruct? updateUserCurrentSubscriptionStruct(
  UserCurrentSubscriptionStruct? userCurrentSubscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCurrentSubscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCurrentSubscriptionStructData(
  Map<String, dynamic> firestoreData,
  UserCurrentSubscriptionStruct? userCurrentSubscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCurrentSubscription == null) {
    return;
  }
  if (userCurrentSubscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userCurrentSubscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCurrentSubscriptionData = getUserCurrentSubscriptionFirestoreData(
      userCurrentSubscription, forFieldValue);
  final nestedData =
      userCurrentSubscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userCurrentSubscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCurrentSubscriptionFirestoreData(
  UserCurrentSubscriptionStruct? userCurrentSubscription, [
  bool forFieldValue = false,
]) {
  if (userCurrentSubscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCurrentSubscription.toMap());

  // Add any Firestore field values
  userCurrentSubscription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCurrentSubscriptionListFirestoreData(
  List<UserCurrentSubscriptionStruct>? userCurrentSubscriptions,
) =>
    userCurrentSubscriptions
        ?.map((e) => getUserCurrentSubscriptionFirestoreData(e, true))
        .toList() ??
    [];
