
import 'package:uuid/uuid.dart';

class ListEntry {

  String uuid = const Uuid().v4();
  String title;
  String description;
  final int createdAt = DateTime.now().millisecondsSinceEpoch;

  ListEntry(this.title, this.description);

  @override
  String toString() {
    return "{ title=$title, description=$description, createdAt=$createdAt }";
  }
}