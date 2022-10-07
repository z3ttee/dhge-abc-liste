
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<List<List<ListEntry>>> {

  static const String ALPHABET = "abcdefghijklmnopqrstuvwxyz";
  static final List<List<ListEntry>> INITIAL_STATE = List.filled(ALPHABET.length, List.empty(growable: true));

  ListCubit() : super(INITIAL_STATE);

  addEntry(String letter, ListEntry entry) {
    int index = ALPHABET.indexOf(letter);

    if (kDebugMode) {
      print("Adding entry to letter $letter (index = $index)");
      print("Letter $letter has ${state[index].length} entries already");
    }

    // Create new object because state is read-only
    List<List<ListEntry>> updatedState = state;
    updatedState[index].add(entry);

    // Emit state change
    emit(updatedState);
  }
}