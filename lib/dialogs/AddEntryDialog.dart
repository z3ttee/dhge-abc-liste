
import 'package:dhge_abc_liste/models/ABCList.dart';
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEntryDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String title;
  final String letter;
  final ABCList list;

  AddEntryDialog({Key? key, required this.title, required this.letter, required this.list}): super(key: key);

  void _dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  State<StatefulWidget> createState() {
    return _AddEntryDialogState();
  }

}

class _AddEntryDialogState extends State<AddEntryDialog> {
  final TextEditingController wordController = TextEditingController(text: "");
  final TextEditingController descriptionController = TextEditingController(text: "");

  String _wordErrorMessage = "";
  String _descriptionErrorMessage = "";

  void _saveEntry(BuildContext context) {
    _resetErrors();

    // var abclist = Provider.of<ABCList>(context, listen: false);

    // Remove whitespaces at start and end
    wordController.text = wordController.text.trim();
    descriptionController.text = descriptionController.text.trim();

    if(wordController.text.isEmpty) {
      _setWordError("Bitte gib hier ein Wort ein");
    } else {
      if(wordController.text.length < 3 || wordController.text.length > 120) {
        _setWordError("Die Eingabe muss mindestens 3 und maximal 120 Zeichen lang sein");
      }
    }

    if(descriptionController.text.isNotEmpty) {
      if(descriptionController.text.length < 3) {
        _setDescriptionError("Die Eingabe muss mindestens 3 Zeichen lang sein");
      }
    }

    // Dismiss the dialog if no error present and save the entry
    if(_wordErrorMessage.isEmpty && _descriptionErrorMessage.isEmpty) {
      ListEntry entry = ListEntry(wordController.text, descriptionController.text);

      if(kDebugMode) {
        print("Saving new entry to list with values $entry");
      }

      widget.list.addEntry(widget.letter, entry);

      widget._dismiss(context);
    }
  }

  void _cancel(BuildContext context) {
    widget._dismiss(context);
  }

  void _resetErrors() {
    _setWordError("");
    _setDescriptionError("");
  }

  void _setWordError(String error) {
    setState(() {
      _wordErrorMessage = error;
    });
  }

  void _setDescriptionError(String error) {
    setState(() {
      _descriptionErrorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(widget.title),
      content: Column(
        children: [
          TextField(
            controller: wordController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Wort"
            ),
            maxLength: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _wordErrorMessage,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12
              ),
            ),
          ),
          TextField(
            controller: descriptionController,
            minLines: 3,
            maxLines: 4,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Beschreibung / Definition"
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _descriptionErrorMessage,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => _saveEntry(context), child: const Text("Speichern")),
        TextButton(onPressed: () => _cancel(context), child: const Text("Abbrechen"))
      ],
    );
  }
}