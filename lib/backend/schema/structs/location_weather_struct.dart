// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationWeatherStruct extends FFFirebaseStruct {
  LocationWeatherStruct({
    String? city,
    int? current,
    int? min,
    int? max,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _current = current,
        _min = min,
        _max = max,
        super(firestoreUtilData);

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "current" field.
  int? _current;
  int get current => _current ?? 0;
  set current(int? val) => _current = val;

  void incrementCurrent(int amount) => current = current + amount;

  bool hasCurrent() => _current != null;

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

  static LocationWeatherStruct fromMap(Map<String, dynamic> data) =>
      LocationWeatherStruct(
        city: data['city'] as String?,
        current: castToType<int>(data['current']),
        min: castToType<int>(data['min']),
        max: castToType<int>(data['max']),
      );

  static LocationWeatherStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationWeatherStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'current': _current,
        'min': _min,
        'max': _max,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'current': serializeParam(
          _current,
          ParamType.int,
        ),
        'min': serializeParam(
          _min,
          ParamType.int,
        ),
        'max': serializeParam(
          _max,
          ParamType.int,
        ),
      }.withoutNulls;

  static LocationWeatherStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationWeatherStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        current: deserializeParam(
          data['current'],
          ParamType.int,
          false,
        ),
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
  String toString() => 'LocationWeatherStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationWeatherStruct &&
        city == other.city &&
        current == other.current &&
        min == other.min &&
        max == other.max;
  }

  @override
  int get hashCode => const ListEquality().hash([city, current, min, max]);
}

LocationWeatherStruct createLocationWeatherStruct({
  String? city,
  int? current,
  int? min,
  int? max,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationWeatherStruct(
      city: city,
      current: current,
      min: min,
      max: max,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationWeatherStruct? updateLocationWeatherStruct(
  LocationWeatherStruct? locationWeather, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationWeather
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationWeatherStructData(
  Map<String, dynamic> firestoreData,
  LocationWeatherStruct? locationWeather,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationWeather == null) {
    return;
  }
  if (locationWeather.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationWeather.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationWeatherData =
      getLocationWeatherFirestoreData(locationWeather, forFieldValue);
  final nestedData =
      locationWeatherData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationWeather.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationWeatherFirestoreData(
  LocationWeatherStruct? locationWeather, [
  bool forFieldValue = false,
]) {
  if (locationWeather == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationWeather.toMap());

  // Add any Firestore field values
  mapToFirestore(locationWeather.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationWeatherListFirestoreData(
  List<LocationWeatherStruct>? locationWeathers,
) =>
    locationWeathers
        ?.map((e) => getLocationWeatherFirestoreData(e, true))
        .toList() ??
    [];
