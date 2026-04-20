// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantInformationStruct extends FFFirebaseStruct {
  PlantInformationStruct({
    String? name,
    String? description,
    List<String>? labels,
    String? overview,
    TemperatureStruct? temperature,
    TemperatureStruct? hardiness,
    List<RequiresStruct>? requires,
    String? sunlight,
    String? soil,
    String? location,
    List<ScientificStruct>? scientific,
    List<String>? images,
    DateTime? created,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _labels = labels,
        _overview = overview,
        _temperature = temperature,
        _hardiness = hardiness,
        _requires = requires,
        _sunlight = sunlight,
        _soil = soil,
        _location = location,
        _scientific = scientific,
        _images = images,
        _created = created,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "labels" field.
  List<String>? _labels;
  List<String> get labels => _labels ?? const [];
  set labels(List<String>? val) => _labels = val;

  void updateLabels(Function(List<String>) updateFn) {
    updateFn(_labels ??= []);
  }

  bool hasLabels() => _labels != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  set overview(String? val) => _overview = val;

  bool hasOverview() => _overview != null;

  // "temperature" field.
  TemperatureStruct? _temperature;
  TemperatureStruct get temperature => _temperature ?? TemperatureStruct();
  set temperature(TemperatureStruct? val) => _temperature = val;

  void updateTemperature(Function(TemperatureStruct) updateFn) {
    updateFn(_temperature ??= TemperatureStruct());
  }

  bool hasTemperature() => _temperature != null;

  // "hardiness" field.
  TemperatureStruct? _hardiness;
  TemperatureStruct get hardiness => _hardiness ?? TemperatureStruct();
  set hardiness(TemperatureStruct? val) => _hardiness = val;

  void updateHardiness(Function(TemperatureStruct) updateFn) {
    updateFn(_hardiness ??= TemperatureStruct());
  }

  bool hasHardiness() => _hardiness != null;

  // "requires" field.
  List<RequiresStruct>? _requires;
  List<RequiresStruct> get requires => _requires ?? const [];
  set requires(List<RequiresStruct>? val) => _requires = val;

  void updateRequires(Function(List<RequiresStruct>) updateFn) {
    updateFn(_requires ??= []);
  }

  bool hasRequires() => _requires != null;

  // "sunlight" field.
  String? _sunlight;
  String get sunlight => _sunlight ?? '';
  set sunlight(String? val) => _sunlight = val;

  bool hasSunlight() => _sunlight != null;

  // "soil" field.
  String? _soil;
  String get soil => _soil ?? '';
  set soil(String? val) => _soil = val;

  bool hasSoil() => _soil != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "scientific" field.
  List<ScientificStruct>? _scientific;
  List<ScientificStruct> get scientific => _scientific ?? const [];
  set scientific(List<ScientificStruct>? val) => _scientific = val;

  void updateScientific(Function(List<ScientificStruct>) updateFn) {
    updateFn(_scientific ??= []);
  }

  bool hasScientific() => _scientific != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  set created(DateTime? val) => _created = val;

  bool hasCreated() => _created != null;

  static PlantInformationStruct fromMap(Map<String, dynamic> data) =>
      PlantInformationStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        labels: getDataList(data['labels']),
        overview: data['overview'] as String?,
        temperature: data['temperature'] is TemperatureStruct
            ? data['temperature']
            : TemperatureStruct.maybeFromMap(data['temperature']),
        hardiness: data['hardiness'] is TemperatureStruct
            ? data['hardiness']
            : TemperatureStruct.maybeFromMap(data['hardiness']),
        requires: getStructList(
          data['requires'],
          RequiresStruct.fromMap,
        ),
        sunlight: data['sunlight'] as String?,
        soil: data['soil'] as String?,
        location: data['location'] as String?,
        scientific: getStructList(
          data['scientific'],
          ScientificStruct.fromMap,
        ),
        images: getDataList(data['images']),
        created: data['created'] as DateTime?,
      );

  static PlantInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? PlantInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'labels': _labels,
        'overview': _overview,
        'temperature': _temperature?.toMap(),
        'hardiness': _hardiness?.toMap(),
        'requires': _requires?.map((e) => e.toMap()).toList(),
        'sunlight': _sunlight,
        'soil': _soil,
        'location': _location,
        'scientific': _scientific?.map((e) => e.toMap()).toList(),
        'images': _images,
        'created': _created,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'labels': serializeParam(
          _labels,
          ParamType.String,
          isList: true,
        ),
        'overview': serializeParam(
          _overview,
          ParamType.String,
        ),
        'temperature': serializeParam(
          _temperature,
          ParamType.DataStruct,
        ),
        'hardiness': serializeParam(
          _hardiness,
          ParamType.DataStruct,
        ),
        'requires': serializeParam(
          _requires,
          ParamType.DataStruct,
          isList: true,
        ),
        'sunlight': serializeParam(
          _sunlight,
          ParamType.String,
        ),
        'soil': serializeParam(
          _soil,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'scientific': serializeParam(
          _scientific,
          ParamType.DataStruct,
          isList: true,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'created': serializeParam(
          _created,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PlantInformationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlantInformationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        labels: deserializeParam<String>(
          data['labels'],
          ParamType.String,
          true,
        ),
        overview: deserializeParam(
          data['overview'],
          ParamType.String,
          false,
        ),
        temperature: deserializeStructParam(
          data['temperature'],
          ParamType.DataStruct,
          false,
          structBuilder: TemperatureStruct.fromSerializableMap,
        ),
        hardiness: deserializeStructParam(
          data['hardiness'],
          ParamType.DataStruct,
          false,
          structBuilder: TemperatureStruct.fromSerializableMap,
        ),
        requires: deserializeStructParam<RequiresStruct>(
          data['requires'],
          ParamType.DataStruct,
          true,
          structBuilder: RequiresStruct.fromSerializableMap,
        ),
        sunlight: deserializeParam(
          data['sunlight'],
          ParamType.String,
          false,
        ),
        soil: deserializeParam(
          data['soil'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        scientific: deserializeStructParam<ScientificStruct>(
          data['scientific'],
          ParamType.DataStruct,
          true,
          structBuilder: ScientificStruct.fromSerializableMap,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PlantInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlantInformationStruct &&
        name == other.name &&
        description == other.description &&
        listEquality.equals(labels, other.labels) &&
        overview == other.overview &&
        temperature == other.temperature &&
        hardiness == other.hardiness &&
        listEquality.equals(requires, other.requires) &&
        sunlight == other.sunlight &&
        soil == other.soil &&
        location == other.location &&
        listEquality.equals(scientific, other.scientific) &&
        listEquality.equals(images, other.images) &&
        created == other.created;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        labels,
        overview,
        temperature,
        hardiness,
        requires,
        sunlight,
        soil,
        location,
        scientific,
        images,
        created
      ]);
}

PlantInformationStruct createPlantInformationStruct({
  String? name,
  String? description,
  String? overview,
  TemperatureStruct? temperature,
  TemperatureStruct? hardiness,
  String? sunlight,
  String? soil,
  String? location,
  DateTime? created,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlantInformationStruct(
      name: name,
      description: description,
      overview: overview,
      temperature:
          temperature ?? (clearUnsetFields ? TemperatureStruct() : null),
      hardiness: hardiness ?? (clearUnsetFields ? TemperatureStruct() : null),
      sunlight: sunlight,
      soil: soil,
      location: location,
      created: created,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlantInformationStruct? updatePlantInformationStruct(
  PlantInformationStruct? plantInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plantInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlantInformationStructData(
  Map<String, dynamic> firestoreData,
  PlantInformationStruct? plantInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plantInformation == null) {
    return;
  }
  if (plantInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plantInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plantInformationData =
      getPlantInformationFirestoreData(plantInformation, forFieldValue);
  final nestedData =
      plantInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plantInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlantInformationFirestoreData(
  PlantInformationStruct? plantInformation, [
  bool forFieldValue = false,
]) {
  if (plantInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plantInformation.toMap());

  // Handle nested data for "temperature" field.
  addTemperatureStructData(
    firestoreData,
    plantInformation.hasTemperature() ? plantInformation.temperature : null,
    'temperature',
    forFieldValue,
  );

  // Handle nested data for "hardiness" field.
  addTemperatureStructData(
    firestoreData,
    plantInformation.hasHardiness() ? plantInformation.hardiness : null,
    'hardiness',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(plantInformation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlantInformationListFirestoreData(
  List<PlantInformationStruct>? plantInformations,
) =>
    plantInformations
        ?.map((e) => getPlantInformationFirestoreData(e, true))
        .toList() ??
    [];
