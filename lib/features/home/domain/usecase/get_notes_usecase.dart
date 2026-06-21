import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetNotesUsecase {
  final NoteRepository repository;

  const GetNotesUsecase({required this.repository});

  Future<Either<Failure, List<Note>>> call() async {
    return await repository.getNotes();
  }
}
