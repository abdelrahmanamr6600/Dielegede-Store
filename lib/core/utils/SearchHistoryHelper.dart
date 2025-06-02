import 'package:hive/hive.dart';

class SearchHistoryHelper {
  static final Box<List> _box = Hive.box<List>('searchBox');

  static List<String> getHistory() {
    return _box.get('history', defaultValue: [])!.cast<String>();
  }

  static Future<void> addSearchTerm(String term) async {
    final history = getHistory();

    if (term.trim().isEmpty) return;

    history.remove(term);
    history.insert(0, term); 

    if (history.length > 10) {
      history.removeLast();
    }
    await _box.put('history', history);
  }

  static Future<void> deleteSearchTerm(String term) async {
    final history = getHistory();
    history.remove(term);
    await _box.put('history', history);
  }

  static Future<void> clearHistory() async {
    await _box.delete('history');
  }
}
