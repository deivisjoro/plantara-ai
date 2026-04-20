import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuggestionsRecord extends FirestoreRecord {
  SuggestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  bool hasOverview() => _overview != null;

  // "identify" field.
  String? _identify;
  String get identify => _identify ?? '';
  bool hasIdentify() => _identify != null;

  // "identifies" field.
  List<String>? _identifies;
  List<String> get identifies => _identifies ?? const [];
  bool hasIdentifies() => _identifies != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _overview = snapshotData['overview'] as String?;
    _identify = snapshotData['identify'] as String?;
    _identifies = getDataList(snapshotData['identifies']);
    _image = snapshotData['image'] as String?;
    _created = snapshotData['created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'default')
          .collection('suggestions');

  static Stream<SuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuggestionsRecord.fromSnapshot(s));

  static Future<SuggestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuggestionsRecord.fromSnapshot(s));

  static SuggestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuggestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuggestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuggestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuggestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuggestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuggestionsRecordData({
  String? title,
  String? type,
  String? overview,
  String? identify,
  String? image,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'type': type,
      'overview': overview,
      'identify': identify,
      'image': image,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuggestionsRecordDocumentEquality implements Equality<SuggestionsRecord> {
  const SuggestionsRecordDocumentEquality();

  @override
  bool equals(SuggestionsRecord? e1, SuggestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.type == e2?.type &&
        e1?.overview == e2?.overview &&
        e1?.identify == e2?.identify &&
        listEquality.equals(e1?.identifies, e2?.identifies) &&
        e1?.image == e2?.image &&
        e1?.created == e2?.created;
  }

  @override
  int hash(SuggestionsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.type,
        e?.overview,
        e?.identify,
        e?.identifies,
        e?.image,
        e?.created
      ]);

  @override
  bool isValidKey(Object? o) => o is SuggestionsRecord;
}
