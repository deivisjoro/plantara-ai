import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantsRecord extends FirestoreRecord {
  PlantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "labels" field.
  List<String>? _labels;
  List<String> get labels => _labels ?? const [];
  bool hasLabels() => _labels != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  bool hasOverview() => _overview != null;

  // "temperature" field.
  TemperatureStruct? _temperature;
  TemperatureStruct get temperature => _temperature ?? TemperatureStruct();
  bool hasTemperature() => _temperature != null;

  // "hardiness" field.
  TemperatureStruct? _hardiness;
  TemperatureStruct get hardiness => _hardiness ?? TemperatureStruct();
  bool hasHardiness() => _hardiness != null;

  // "requires" field.
  List<RequiresStruct>? _requires;
  List<RequiresStruct> get requires => _requires ?? const [];
  bool hasRequires() => _requires != null;

  // "sunlight" field.
  String? _sunlight;
  String get sunlight => _sunlight ?? '';
  bool hasSunlight() => _sunlight != null;

  // "soil" field.
  String? _soil;
  String get soil => _soil ?? '';
  bool hasSoil() => _soil != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "scientific" field.
  List<ScientificStruct>? _scientific;
  List<ScientificStruct> get scientific => _scientific ?? const [];
  bool hasScientific() => _scientific != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _labels = getDataList(snapshotData['labels']);
    _overview = snapshotData['overview'] as String?;
    _temperature = snapshotData['temperature'] is TemperatureStruct
        ? snapshotData['temperature']
        : TemperatureStruct.maybeFromMap(snapshotData['temperature']);
    _hardiness = snapshotData['hardiness'] is TemperatureStruct
        ? snapshotData['hardiness']
        : TemperatureStruct.maybeFromMap(snapshotData['hardiness']);
    _requires = getStructList(
      snapshotData['requires'],
      RequiresStruct.fromMap,
    );
    _sunlight = snapshotData['sunlight'] as String?;
    _soil = snapshotData['soil'] as String?;
    _location = snapshotData['location'] as String?;
    _images = getDataList(snapshotData['images']);
    _scientific = getStructList(
      snapshotData['scientific'],
      ScientificStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'default')
          .collection('plants');

  static Stream<PlantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantsRecord.fromSnapshot(s));

  static Future<PlantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantsRecord.fromSnapshot(s));

  static PlantsRecord fromSnapshot(DocumentSnapshot snapshot) => PlantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantsRecordData({
  String? name,
  DocumentReference? category,
  String? description,
  String? overview,
  TemperatureStruct? temperature,
  TemperatureStruct? hardiness,
  String? sunlight,
  String? soil,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'description': description,
      'overview': overview,
      'temperature': TemperatureStruct().toMap(),
      'hardiness': TemperatureStruct().toMap(),
      'sunlight': sunlight,
      'soil': soil,
      'location': location,
    }.withoutNulls,
  );

  // Handle nested data for "temperature" field.
  addTemperatureStructData(firestoreData, temperature, 'temperature');

  // Handle nested data for "hardiness" field.
  addTemperatureStructData(firestoreData, hardiness, 'hardiness');

  return firestoreData;
}

class PlantsRecordDocumentEquality implements Equality<PlantsRecord> {
  const PlantsRecordDocumentEquality();

  @override
  bool equals(PlantsRecord? e1, PlantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.labels, e2?.labels) &&
        e1?.overview == e2?.overview &&
        e1?.temperature == e2?.temperature &&
        e1?.hardiness == e2?.hardiness &&
        listEquality.equals(e1?.requires, e2?.requires) &&
        e1?.sunlight == e2?.sunlight &&
        e1?.soil == e2?.soil &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.scientific, e2?.scientific);
  }

  @override
  int hash(PlantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.category,
        e?.description,
        e?.labels,
        e?.overview,
        e?.temperature,
        e?.hardiness,
        e?.requires,
        e?.sunlight,
        e?.soil,
        e?.location,
        e?.images,
        e?.scientific
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantsRecord;
}
