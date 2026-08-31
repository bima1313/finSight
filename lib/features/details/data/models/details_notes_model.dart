import 'dart:convert';

import 'package:fin_sight/shared/data/models/note_model.dart';
import 'package:fin_sight/features/details/domain/entities/details_notes.dart';

class DetailsNotesModel extends DetailsNotes {
  const DetailsNotesModel({
    required super.amount,
    required super.datetime,
    required List<NoteModel> notes,
  }) : super(notes: notes);

  factory DetailsNotesModel.fromJson(Map<String, dynamic> json) {
    return DetailsNotesModel(
      amount: json["amount"],
      datetime: DateTime.parse(json["created_at"]),
      notes: jsonDecode(
        json["notes"],
      ).map<NoteModel>((data) => NoteModel.fromList(data)).toList(),
    );
  }
}
