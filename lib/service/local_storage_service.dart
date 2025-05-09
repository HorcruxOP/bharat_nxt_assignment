import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final String _key = 'favourite_ids';

  Future<void> saveIds(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids);
  }

  Future<List<String>> getIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> addId(String id) async {
    List<String> ids = await getIds();
    if (!ids.contains(id)) {
      ids.add(id);
      await saveIds(ids);
    }
  }

  Future<void> removeId(String id) async {
    List<String> ids = await getIds();
    ids.remove(id);
    await saveIds(ids);
  }
}
