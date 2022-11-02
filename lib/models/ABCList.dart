
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/foundation.dart';

class ABCList extends ChangeNotifier {
  // static const String ALPHABET = "abcdefghijklmnopqrstuvwxyz";

  final Map<String, List<ListEntry>> _entries = {
    "a": [
      ListEntry("Test 1", "Das ist der erste test"),
      ListEntry("Test 2", "Das ist der zweite test")
    ],
    "b": [
      ListEntry("Test 3", "Das ist der erste test"),
    ]
  };

  Map<String, List<ListEntry>> getAllEntries() {
    return _entries;
  }

  List<ListEntry> getEntries(String letter) {
    return _entries[letter.toLowerCase()] ?? [];
  }

  void addEntry(String letter, ListEntry entry) {
    final List<ListEntry> letterEntries = _entries[letter.toLowerCase()] ?? [];

    if (kDebugMode) {
      print("Adding entry to letter $letter");
      print("Letter $letter has ${letterEntries.length} entries already");
    }

    letterEntries.add(entry);

    _entries[letter.toLowerCase()] = letterEntries;
    notifyListeners();
  }



}