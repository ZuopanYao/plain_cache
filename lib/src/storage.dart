import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart' as security;
import 'package:path_provider/path_provider.dart';

class PlainCache {
  static const String _dataFileName = 'SimpleCache.data';
  static Map<String, dynamic> _storage = {};
  static final security.Key _key = security.Key.fromUtf8('DCBB0AE215A52F0C');
  static final security.IV _iv = security.IV.fromUtf8('DCBB0AE215A52F0C');
  static final security.Encrypter _encrypter =
      security.Encrypter(security.AES(_key));

  /// Data path
  static Future<String> _dataPath() {
    return getApplicationDocumentsDirectory()
        .then((value) => value.uri.toFilePath() + _dataFileName);
  }

  static void enable() {
    _read();
  }

  /// Save to path
  static void _save() async {
    final json = jsonEncode(_storage);
    final encrypt = _encrypter.encrypt(json, iv: _iv).base64;
    final dataPath = await _dataPath();
    try {
      var file = File(dataPath);
      await file.writeAsString(encrypt);
    } catch (e) {
      print(e);
    }
  }

  /// Read from path
  static void _read() async {
    final dataPath = await _dataPath();
    try {
      final file = File(dataPath);
      final base64 = await file.readAsString();
      final json = _encrypter.decrypt64(base64, iv: _iv);
      _storage = jsonDecode(json);
    } catch (e) {
      print(e);
    }
  }

  /// Read as String from persistent cache
  String? getString({String? forKey}) {
    assert(forKey != null);
    return _storage[forKey];
  }

  /// Read as int from persistent cache
  int getInt({String? forKey}) {
    assert(forKey != null);
    final value = _storage[forKey];
    if (value == null) {
      return 0;
    }
    return value;
  }

  /// Read as double from persistent cache
  double getDouble({String? forKey}) {
    assert(forKey != null);
    final value = _storage[forKey];
    if (value == null) {
      return 0.0;
    }
    return value;
  }

  /// Read as bool from persistent cache
  bool getBool({String? forKey}) {
    assert(forKey != null);
    final value = _storage[forKey];
    if (value == null) {
      return false;
    }
    return value;
  }

  /// Read as List from persistent cache
  List<dynamic>? getList({String? forKey}) {
    assert(forKey != null);
    return _storage[forKey];
  }

  /// Read as Map from persistent cache
  Map<String, dynamic>? getMap({String? forKey}) {
    assert(forKey != null);
    return _storage[forKey];
  }

  /// Save to persistent cache
  void setValue(dynamic newValue, {String? forKey}) {
    assert(forKey != null);
    if (forKey is String) {
      _storage[forKey] = newValue;
      _save();
    }
  }

  /// Remove from persistent cache
  void remove({String? forKey}) {
    assert(forKey != null);
    _storage.remove(forKey);
    _save();
  }
}

final storage = PlainCache();
