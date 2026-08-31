import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/details/data/mocks/datasource/details_notes_local_data_source_preview.dart';
import 'package:fin_sight/features/details/domain/entities/details_notes.dart';
import 'package:fin_sight/features/details/domain/repositories/details_notes_repository.dart';
import 'package:fpdart/fpdart.dart';

class DetailsNotesRepositoryImplPreview implements DetailsNotesRepository {
  final DetailsNotesLocalDataSourcePreview localDataSource;

  const DetailsNotesRepositoryImplPreview({required this.localDataSource});
  @override
  Future<Either<Failure, List<DetailsNotes>>> getDetailsNotes({
    required String dateTime,
  }) async {
    try {
      final data = localDataSource.getDetailsNotes(dateTime: dateTime);
      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }
}
