import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double latLon(
  bool returnLat,
  LatLng latlon,
) {
  if (returnLat) {
    return latlon.latitude;
  } else {
    return latlon.longitude;
  }
}

DocumentReference flowersPlantingReference() {
  return FirebaseFirestore.instance
      .collection('category')
      .doc('r5KEDXErQ0MKavh0Vocx');
}

bool filterCategory(int? columnFlowers) {
  return true;
}
