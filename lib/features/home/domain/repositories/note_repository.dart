import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, void>> createNote({required Note note});
}
