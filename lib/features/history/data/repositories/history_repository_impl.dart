import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/history/data/datasource/history_local_data_source.dart';
import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource localDataSource;
  const HistoryRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<DatabaseFailure, List<History>>> getHistories({
    required int year,
  }) async {
    try {
      final data = await localDataSource.getHistories(year: year);

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<DatabaseFailure, double>> getTotal({required int year}) async {
    try {
      final data = await localDataSource.getTotal(year: year);

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<DatabaseFailure, List<int>>> getYears() async {
    try {
      final data = await localDataSource.getYears();

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }
}
