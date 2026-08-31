import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/details/data/datasource/details_notes_local_data_source.dart';
import 'package:fin_sight/features/details/domain/entities/details_notes.dart';
import 'package:fin_sight/features/details/domain/repositories/details_notes_repository.dart';
import 'package:fpdart/fpdart.dart';

class DetailsNotesRepositoryImpl implements DetailsNotesRepository {
  final DetailsNotesLocalDataSource localDataSource;

  const DetailsNotesRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<DetailsNotes>>> getDetailsNotes({
    required String dateTime,
  }) async {
    try {
      final data = await localDataSource.getDetailsNotes(dateTime: dateTime);

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }
}
