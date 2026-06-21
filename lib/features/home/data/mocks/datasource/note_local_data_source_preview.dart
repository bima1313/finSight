import 'package:fin_sight/core/constants/dummy_data.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/home/data/models/note_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NoteLocalDataSourcePreview {
  Future<List<NoteModel>> getNotes();
  Future<void> createNote({required NoteModel note});
}

class MockNoteLocalDataSourceImplPreview implements NoteLocalDataSourcePreview {
  const MockNoteLocalDataSourceImplPreview();
  @override
  Future<List<NoteModel>> getNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final data = dummyData["data"]!.map((json) {
        final copyData = Map<String, dynamic>.from(json);
        copyData.update(
          'created_at',
          (value) => DateTime.parse(value.toString()),
        );
        return NoteModel.fromJson(copyData);
      }).toList();

      return data;
    } catch (e) {
      throw DatabaseException(message: "Can't Fetch Data");
    }
  }

  @override
  Future<void> createNote({required NoteModel note}) {
    throw UnimplementedError();
  }
}
