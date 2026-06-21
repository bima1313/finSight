import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetHistoriesUsecase {
  final HistoryRepository historyRepository;

  const GetHistoriesUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, List<History>>> call({
    required int year,
  }) async {
    return await historyRepository.getHistories(year: year);
  }
}
