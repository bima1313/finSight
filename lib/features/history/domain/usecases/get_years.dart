import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetYearsUsecase {
  final HistoryRepository historyRepository;

  const GetYearsUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, List<int>>> call() async {
    return await historyRepository.getYears();
  }
}
