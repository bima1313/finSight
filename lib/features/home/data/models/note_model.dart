import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:fin_sight/shared/utils/datetime_parser.dart';

class NoteModel extends Note {
  const NoteModel({
    required super.title,
    required super.category,
    required super.amount,
    required super.dateTime,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json["title"],
      category: json["category"],
      amount: json["amount"],
      dateTime: json["created_at"],
    );
  }

  factory NoteModel.fromEntity(Note note) {
    return NoteModel(
      title: note.title,
      category: note.category,
      amount: note.amount,
      dateTime: note.dateTime,
    );
  }
  Map<String, Object?> toMap() {
    return {
      "title": title,
      "amount": amount,
      "category": category,
      "created_at": dateTime.formatingDate(),
    };
  }
}
