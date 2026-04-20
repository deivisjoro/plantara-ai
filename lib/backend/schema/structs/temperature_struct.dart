// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TemperatureStruct extends FFFirebaseStruct {
  TemperatureStruct({
    int? min,
    int? max,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _min = min,
        _max = max,
        super(firestoreUtilData);

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  set min(int? val) => _min = val;

  void incrementMin(int amount) => min = min + amount;

  bool hasMin() => _min != null;

  // "max" field.
  int? _max;
  int get max => _max ?? 0;
  set max(int? val) => _max = val;

  void incrementMax(int amount) => max = max + amount;

  bool hasMax() => _max != null;

  static TemperatureStruct fromMap(Map<String, dynamic> data) =>
      TemperatureStruct(
        min: castToType<int>(data['min']),
        max: castToType<int>(data['max']),
      );

  static TemperatureStruct? maybeFromMap(dynamic data) => data is Map
      ? TemperatureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'min': _min,
        'max': _max,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'min': serializeParam(
          _min,
          ParamType.int,
        ),
        'max': serializeParam(
          _max,
          ParamType.int,
        ),
      }.withoutNulls;

  static TemperatureStruct fromSerializableMap(Map<String, dynamic> data) =>
      TemperatureStruct(
        min: deserializeParam(
          data['min'],
          ParamType.int,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TemperatureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TemperatureStruct && min == other.min && max == other.max;
  }

  @override
  int get hashCode => const ListEquality().hash([min, max]);
}

TemperatureStruct createTemperatureStruct({
  int? min,
  int? max,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TemperatureStruct(
      min: min,
      max: max,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TemperatureStruct? updateTemperatureStruct(
  TemperatureStruct? temperature, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    temperature
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTemperatureStructData(
  Map<String, dynamic> firestoreData,
  TemperatureStruct? temperature,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (temperature == null) {
    return;
  }
  if (temperature.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && temperature.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final temperatureData =
      getTemperatureFirestoreData(temperature, forFieldValue);
  final nestedData =
      temperatureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = temperature.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTemperatureFirestoreData(
  TemperatureStruct? temperature, [
  bool forFieldValue = false,
]) {
  if (temperature == null) {
    return {};
  }
  final firestoreData = mapToFirestore(temperature.toMap());

  // Add any Firestore field values
  mapToFirestore(temperature.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTemperatureListFirestoreData(
  List<TemperatureStruct>? temperatures,
) =>
    temperatures?.map((e) => getTemperatureFirestoreData(e, true)).toList() ??
    [];
