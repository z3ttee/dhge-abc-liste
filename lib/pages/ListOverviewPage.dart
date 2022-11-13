
import 'package:dhge_abc_liste/dialogs/AddEntryDialog.dart';
import 'package:dhge_abc_liste/models/ABCList.dart';
import 'package:dhge_abc_liste/pages/WordOverviewPage.dart';
import 'package:dhge_abc_liste/utils/constants.dart';
import 'package:dhge_abc_liste/widgets/letter-card-widget.dart';
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

                  return LetterCardWidget(
                      letter: letter,
                      entries:  list.getEntriesToList(letter),
                      onNavigate: () => routeToWordsPage(context, list, letter),
                      onAddClicked: () => _openAddEntryDialog(context, Constants.ALPHABET.characters.elementAt(letterIndex), list)
                  );
                }
            );
          },
        )
    );
  }

}