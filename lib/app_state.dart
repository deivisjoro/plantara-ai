import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isFromSetup = prefs.getBool('ff_isFromSetup') ?? _isFromSetup;
    });
    _safeInit(() {
      _ThemeSystem = prefs.getBool('ff_ThemeSystem') ?? _ThemeSystem;
    });
    _safeInit(() {
      _Languages = prefs.containsKey('ff_Languages')
          ? deserializeEnum<Language>(prefs.getString('ff_Languages'))
          : _Languages;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_LocationWeather')) {
        try {
          final serializedData = prefs.getString('ff_LocationWeather') ?? '{}';
          _LocationWeather = LocationWeatherStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isFromSetup = true;
  bool get isFromSetup => _isFromSetup;
  set isFromSetup(bool value) {
    _isFromSetup = value;
    prefs.setBool('ff_isFromSetup', value);
  }

  bool _ThemeSystem = false;
  bool get ThemeSystem => _ThemeSystem;
  set ThemeSystem(bool value) {
    _ThemeSystem = value;
    prefs.setBool('ff_ThemeSystem', value);
  }

  Language? _Languages = Language.English;
  Language? get Languages => _Languages;
  set Languages(Language? value) {
    _Languages = value;
    value != null
        ? prefs.setString('ff_Languages', value.serialize())
        : prefs.remove('ff_Languages');
  }

  double _gradient = 0.0;
  double get gradient => _gradient;
  set gradient(double value) {
    _gradient = value;
  }

  int _Segment = 1;
  int get Segment => _Segment;
  set Segment(int value) {
    _Segment = value;
  }

  LocationWeatherStruct _LocationWeather =
      LocationWeatherStruct.fromSerializableMap(jsonDecode(
          '{\"city\":\"Loading...\",\"current\":\"0\",\"min\":\"0\",\"max\":\"0\"}'));
  LocationWeatherStruct get LocationWeather => _LocationWeather;
  set LocationWeather(LocationWeatherStruct value) {
    _LocationWeather = value;
    prefs.setString('ff_LocationWeather', value.serialize());
  }

  void updateLocationWeatherStruct(Function(LocationWeatherStruct) updateFn) {
    updateFn(_LocationWeather);
    prefs.setString('ff_LocationWeather', _LocationWeather.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
