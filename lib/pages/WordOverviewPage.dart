
import 'package:dhge_abc_liste/models/ABCList.dart';
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:dhge_abc_liste/widgets/word-card-widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/AddEntryDialog.dart';

class WordOverviewWidget extends StatelessWidget {
  final String letter;
  final ABCList list;

  const WordOverviewWidget({Key? key, required this.letter, required this.list}) : super(key: key);

  void _openAddEntryDialog(BuildContext context, String letter, ABCList list, ListEntry? entry) async {
    if(kDebugMode) {
      print("openAddEntryDialog(): Opening dialog because user wants to add a new entry to the list.");
    }

    // Open the dialog
    await showDialog(
        context: context,
        builder: (context) => AddEntryDialog(title: "Eintrag hinzufügen", letter: letter, list: list, entry: entry,)
    );
  }

  void _removeEntryFromList(ABCList abclist, String entryId) {
    abclist.removeEntry(letter, entryId);
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider.value(
        value: list,
        child: Consumer<ABCList>(
          builder: (context, list, child) {
            return Scaffold(
              appBar: AppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list.title, style: const TextStyle(
                      fontSize: 12,
                    ),),
                    Text("Wörter zu ${letter.toUpperCase()}"),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _openAddEntryDialog(context, letter, list, null);
                },
                child: const Icon(Icons.add),
              ),
              body: ListView.builder(
                  itemCount: list.getEntries(letter).length,
                  itemBuilder: (BuildContext context, int wordIndex) {
                    var wordEntry = list.getEntriesToList(letter).elementAt(wordIndex);

                    return WordCardWidget(
                        entry: wordEntry,
                        onEditClicked: () => _openAddEntryDialog(context, letter, list, wordEntry),
                        onDeleteClicked: () => _removeEntryFromList(list, wordEntry.uuid)
                    );
                  }
              ),
            );
          },
        ),
    );
  }

}