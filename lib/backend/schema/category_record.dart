import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "index_home" field.
  int? _indexHome;
  int get indexHome => _indexHome ?? 0;
  bool hasIndexHome() => _indexHome != null;

  // "column_flowers" field.
  int? _columnFlowers;
  int get columnFlowers => _columnFlowers ?? 0;
  bool hasColumnFlowers() => _columnFlowers != null;

  // "index_flowers" field.
  int? _indexFlowers;
  int get indexFlowers => _indexFlowers ?? 0;
  bool hasIndexFlowers() => _indexFlowers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _indexHome = castToType<int>(snapshotData['index_home']);
    _columnFlowers = castToType<int>(snapshotData['column_flowers']);
    _indexFlowers = castToType<int>(snapshotData['index_flowers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'default')
          .collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? name,
  String? image,
  int? indexHome,
  int? columnFlowers,
  int? indexFlowers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'index_home': indexHome,
      'column_flowers': columnFlowers,
      'index_flowers': indexFlowers,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.indexHome == e2?.indexHome &&
        e1?.columnFlowers == e2?.columnFlowers &&
        e1?.indexFlowers == e2?.indexFlowers;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash(
      [e?.name, e?.image, e?.indexHome, e?.columnFlowers, e?.indexFlowers]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
