import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class HistoryRepository {
  Future<Either<DatabaseFailure, List<int>>> getYears();
  Future<Either<DatabaseFailure, double>> getTotal({required int year});
  Future<Either<DatabaseFailure, List<History>>> getHistories({
    required int year,
  });
}
