import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _allTasks = await secureStorage.getInt('ff_allTasks') ?? _allTasks;
    });
    await _safeInitAsync(() async {
      _importantTasks =
          await secureStorage.getInt('ff_importantTasks') ?? _importantTasks;
    });
    await _safeInitAsync(() async {
      _completedTasks =
          await secureStorage.getInt('ff_completedTasks') ?? _completedTasks;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _allTasks = 0;
  int get allTasks => _allTasks;
  set allTasks(int _value) {
    _allTasks = _value;
    secureStorage.setInt('ff_allTasks', _value);
  }

  void deleteAllTasks() {
    secureStorage.delete(key: 'ff_allTasks');
  }

  int _importantTasks = 0;
  int get importantTasks => _importantTasks;
  set importantTasks(int _value) {
    _importantTasks = _value;
    secureStorage.setInt('ff_importantTasks', _value);
  }

  void deleteImportantTasks() {
    secureStorage.delete(key: 'ff_importantTasks');
  }

  int _completedTasks = 0;
  int get completedTasks => _completedTasks;
  set completedTasks(int _value) {
    _completedTasks = _value;
    secureStorage.setInt('ff_completedTasks', _value);
  }

  void deleteCompletedTasks() {
    secureStorage.delete(key: 'ff_completedTasks');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
