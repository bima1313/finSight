import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTotalUsecase {
  final HistoryRepository historyRepository;

  const GetTotalUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, double>> call({required int year}) async {
    return await historyRepository.getTotal(year: year);
  }
}
