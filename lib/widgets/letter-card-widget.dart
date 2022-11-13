
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/material.dart';

class LetterCardWidget extends StatelessWidget {
  final String letter;
  final List<ListEntry> entries;

  final Function onNavigate;
  final Function onAddClicked;

  const LetterCardWidget({
    Key? key,
    required this.letter,
    required this.entries,
    required this.onNavigate,
    required this.onAddClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstWord = "Noch keine Enträge vorhanden.";

    if(entries.isNotEmpty) {
      var entry = entries[0];
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
                letter.toUpperCase(),
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
                                Text(
                                  firstWord,
                                  style: const TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                if(entries.length > 1)
                                  Container(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text(
                                      "+ " + (entries.length - 1).toString() + " weiter" + ((entries.length - 1) != 1 ? "e" : "es"),
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
                              if(entries.isNotEmpty)
                                TextButton(
                                  onPressed: () => onNavigate(),
                                  child: const Text("Mehr anzeigen"),
                                ),
                              TextButton(
                                onPressed: () => onAddClicked(),
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

}