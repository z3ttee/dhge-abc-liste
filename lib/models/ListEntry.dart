
class ListEntry {

  String title;
  String description;
  final int createdAt = DateTime.now().millisecondsSinceEpoch;

  ListEntry(this.title, this.description);

  @override
  String toString() {
    return "{ title=$title, description=$description, createdAt=$createdAt }";
  }
}