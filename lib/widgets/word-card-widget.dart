
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/material.dart';

class WordCardWidget extends StatelessWidget {
  final ListEntry entry;

  final Function onEditClicked;
  final Function onDeleteClicked;

  const WordCardWidget({
    Key? key,
    required this.entry,
    required this.onEditClicked,
    required this.onDeleteClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.title, style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),

            if(entry.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(entry.description, style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38
                ),),
              ),

            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => onEditClicked(),
                    child: const Text("Bearbeiten"),
                  ),
                  TextButton(
                    onPressed: () => onDeleteClicked(),
                    child: const Text("Löschen"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}