
import 'package:dhge_abc_liste/dialogs/AddEntryDialog.dart';
import 'package:dhge_abc_liste/models/ABCList.dart';
import 'package:dhge_abc_liste/pages/WordOverviewPage.dart';
import 'package:dhge_abc_liste/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOverviewWidget extends StatelessWidget {
  const ListOverviewWidget({Key? key}) : super(key: key);

  void _openAddEntryDialog(BuildContext context, String letter, ABCList list) async {
    if(kDebugMode) {
      print("openAddEntryDialog(): Opening dialog because user wants to add a new entry to the list.");
    }

    // Open the dialog
    await showDialog(
        context: context,
        builder: (context) => AddEntryDialog(title: "Eintrag hinzufügen", letter: letter, list: list,)
    );
  }

  void routeToWordsPage(BuildContext context, ABCList list, String letter) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WordOverviewWidget(
      list: list,
        letter: letter
    )));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ABCList(),
        child: Consumer<ABCList>(
          builder: (context, list, child) {
            return ListView.builder(
                itemCount: Constants.ALPHABET.length,
                itemBuilder: (BuildContext context, int letterIndex) {
                  var letter = Constants.ALPHABET.characters.elementAt(letterIndex);
                  var letterEntries = list.getEntries(letter);
                  var firstWord = "Noch keine Enträge vorhanden.";
                  var hasMoreThanOne = letterEntries.length > 1;

                  if(letterEntries.isNotEmpty) {
                    var entry = letterEntries[0];
                    firstWord = entry.title;
                  }

                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              Constants.ALPHABET.characters.elementAt(letterIndex).toUpperCase(),
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Card(
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                firstWord,
                                                style: const TextStyle(
                                                    fontSize: 18
                                                ),
                                              ),
                                            ),
                                            if(hasMoreThanOne)
                                              Container(
                                                padding: const EdgeInsets.only(left: 0),
                                                child: Text(
                                                  "+ " + (letterEntries.length - 1).toString() + " weiter" + ((letterEntries.length - 1) != 1 ? "e" : "es"),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black26
                                                  ),
                                                ),
                                              )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          if(hasMoreThanOne)
                                            TextButton(
                                              onPressed: () => {
                                                routeToWordsPage(context, list, letter)
                                              },
                                              child: const Text("Mehr anzeigen"),
                                            ),
                                          TextButton(
                                            onPressed: () => _openAddEntryDialog(context, Constants.ALPHABET.characters.elementAt(letterIndex), list),
                                            child: const Text("Hinzufügen"),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            )
                        )
                      ],
                    ),
                  );
                }
            );
          },
        )
    );
  }

}