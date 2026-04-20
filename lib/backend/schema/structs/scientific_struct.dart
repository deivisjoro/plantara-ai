// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ScientificStruct extends FFFirebaseStruct {
  ScientificStruct({
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static ScientificStruct fromMap(Map<String, dynamic> data) =>
      ScientificStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static ScientificStruct? maybeFromMap(dynamic data) => data is Map
      ? ScientificStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScientificStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScientificStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ScientificStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScientificStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

ScientificStruct createScientificStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScientificStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScientificStruct? updateScientificStruct(
  ScientificStruct? scientific, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scientific
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScientificStructData(
  Map<String, dynamic> firestoreData,
  ScientificStruct? scientific,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scientific == null) {
    return;
  }
  if (scientific.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scientific.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scientificData = getScientificFirestoreData(scientific, forFieldValue);
  final nestedData = scientificData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = scientific.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScientificFirestoreData(
  ScientificStruct? scientific, [
  bool forFieldValue = false,
]) {
  if (scientific == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scientific.toMap());

  // Add any Firestore field values
  mapToFirestore(scientific.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScientificListFirestoreData(
  List<ScientificStruct>? scientifics,
) =>
    scientifics?.map((e) => getScientificFirestoreData(e, true)).toList() ?? [];
