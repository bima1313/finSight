import 'package:fin_sight/features/home/data/models/note_model.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final noteModel = NoteModel(
    title: "test",
    category: "transportation",
    amount: 100.0,
    dateTime: DateTime(2018, 9, 7, 18, 25, 30),
  );
  test("Should be a subclass of Note entity", () {
    expect(noteModel, isA<Note>());
  });

  test("Should return a valid model from JSON", () {
    final jsonModel = {
      "title": "test",
      "category": "transportation",
      "amount": 100.0,
      "created_at": DateTime(2018, 9, 7, 18, 25, 30),
    };

    final result = NoteModel.fromJson(jsonModel);

    expect(result.title, noteModel.title);
    expect(result.category, noteModel.category);
    expect(result.amount, noteModel.amount);
  });

  test("Should return a valid entity when fromEntity is called", () {
    final note = Note(
      title: "testing",
      category: "dining",
      amount: 32.50,
      dateTime: DateTime(2018, 9, 7, 18, 25, 30),
    );

    final result = NoteModel.fromEntity(note);

    expect(result.title, note.title);
    expect(result.category, note.category);
    expect(result.amount, note.amount);
  });
  test("Should return a valid map when toMap is called", () {
    final expectedMap = {
      "title": "test",
      "category": "transportation",
      "amount": 100.0,
      "created_at": "2018-09-07 18:25:30",
    };
    final result = noteModel.toMap();

    expect(result, expectedMap);
  });
}
