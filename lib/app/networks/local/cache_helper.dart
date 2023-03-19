import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/constants_manager.dart';
import 'my_shared_preferences_keys.dart';

class Supervisor {
  late SharedPreferences _preferences;

  Future<SharedPreferences> initSP() async {
    printTest('initSP');
    return _preferences = await SharedPreferences.getInstance();
  }

  void putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    await _preferences.setString(key.name, value ?? "");
  }

  String getString({required MySharedKeys key}) {
    return _preferences.getString(key.name) ?? "";
  }
}
