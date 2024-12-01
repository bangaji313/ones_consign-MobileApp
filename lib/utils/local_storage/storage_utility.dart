import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  // Method to save data to local storage
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Methode to read data from local storage
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Method to remove data from local storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Method to clear all data from local storage
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}