// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequiresStruct extends FFFirebaseStruct {
  RequiresStruct({
    RequiresType? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  RequiresType? _title;
  RequiresType? get title => _title;
  set title(RequiresType? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static RequiresStruct fromMap(Map<String, dynamic> data) => RequiresStruct(
        title: data['title'] is RequiresType
            ? data['title']
            : deserializeEnum<RequiresType>(data['title']),
        description: data['description'] as String?,
      );

  static RequiresStruct? maybeFromMap(dynamic data) =>
      data is Map ? RequiresStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title?.serialize(),
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.Enum,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static RequiresStruct fromSerializableMap(Map<String, dynamic> data) =>
      RequiresStruct(
        title: deserializeParam<RequiresType>(
          data['title'],
          ParamType.Enum,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RequiresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RequiresStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

RequiresStruct createRequiresStruct({
  RequiresType? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RequiresStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RequiresStruct? updateRequiresStruct(
  RequiresStruct? requires, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    requires
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRequiresStructData(
  Map<String, dynamic> firestoreData,
  RequiresStruct? requires,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (requires == null) {
    return;
  }
  if (requires.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && requires.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final requiresData = getRequiresFirestoreData(requires, forFieldValue);
  final nestedData = requiresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = requires.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRequiresFirestoreData(
  RequiresStruct? requires, [
  bool forFieldValue = false,
]) {
  if (requires == null) {
    return {};
  }
  final firestoreData = mapToFirestore(requires.toMap());

  // Add any Firestore field values
  mapToFirestore(requires.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRequiresListFirestoreData(
  List<RequiresStruct>? requiress,
) =>
    requiress?.map((e) => getRequiresFirestoreData(e, true)).toList() ?? [];
