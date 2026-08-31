import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/details/domain/entities/details_notes.dart';
import 'package:fin_sight/features/details/domain/repositories/details_notes_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDetailsNotesUsecase {
  final DetailsNotesRepository repository;

  const GetDetailsNotesUsecase({required this.repository});

  Future<Either<Failure, List<DetailsNotes>>> call({
    required String dateTime,
  }) async {
    return await repository.getDetailsNotes(dateTime: dateTime);
  }
}
