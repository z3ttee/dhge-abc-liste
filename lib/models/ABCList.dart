
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/foundation.dart';

class ABCList extends ChangeNotifier {
  final Map<String, Map<String, ListEntry>> _entries = {};
  final String title = "ABC Liste";

  Map<String, Map<String, ListEntry>> getAllEntries() {
    return _entries;
  }

  List<ListEntry> getAllEntriesToList() {
    List<Map<String, ListEntry>> entryMaps = _entries.values.toList();
    List<ListEntry> entryList = [];

    for (var element in entryMaps) {
        entryList.addAll(element.values);
    }

    return entryList;
  }

  Map<String, ListEntry> getEntries(String letter) {
    return _entries[letter.toLowerCase()] ?? {};
  }

  List<ListEntry> getEntriesToList(String letter) {
    return _entries[letter.toLowerCase()]?.values.toList() ?? [];
  }

  void removeEntry(String letter, String entryId) {
    final Map<String, ListEntry> letterEntries = getEntries(letter);
    letterEntries.remove(entryId);

    if (kDebugMode) {
      print("Removing entry '$entryId' from letter '$letter'. Letter has ${letterEntries.length} entries left");
    }

    _entries[letter.toLowerCase()] = letterEntries;
    notifyListeners();
  }

  void setEntry(String letter, ListEntry entry) {
    final Map<String, ListEntry> letterEntries = getEntries(letter);
    letterEntries[entry.uuid] = entry;

    _entries[letter.toLowerCase()] = letterEntries;
    notifyListeners();
  }

}