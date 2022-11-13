
import 'package:uuid/uuid.dart';

class ListEntry {

  late String uuid;
  late String title;
  late String description;
  late int? createdAt;

  ListEntry({String? uuid, String? title, String? description, int? createdAt}) {
    this.uuid = uuid ?? const Uuid().v4();
    this.title = title ?? "ABC Liste";
    this.description = description ?? "";
    this.createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch;
  }

  @override
  String toString() {
    return "{ title=$title, description=$description, createdAt=$createdAt }";
  }

  Map<String, dynamic> toJson() {
    return {
      "uuid": uuid,
      "title": title,
      "description": description,
      "createdAt": createdAt
    };
  }

  static ListEntry fromJson(Map<String, dynamic> json) {
    ListEntry entry = ListEntry(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"]
    );

    return entry;
  }
}