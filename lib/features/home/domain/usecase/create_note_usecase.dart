import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateNoteUsecase {
  final NoteRepository repository;

  const CreateNoteUsecase({required this.repository});

  Future<Either<Failure, void>> call({required Note note}) async {
    return await repository.createNote(note: note);
  }
}
