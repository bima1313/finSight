import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/features/history/data/datasource/history_local_data_source.dart';
import 'package:fin_sight/features/history/data/repositories/history_repository_impl.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fin_sight/features/history/domain/usecases/get_histories.dart';
import 'package:fin_sight/features/history/domain/usecases/get_total.dart';
import 'package:fin_sight/features/history/domain/usecases/get_years.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_total_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_years_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/histories_data_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLite());
    Get.lazyPut<HistoryLocalDataSource>(
      () => HistoryLocalDataSourceImpl(dbHelper: Get.find()),
    );
    Get.lazyPut<HistoryRepository>(
      () => HistoryRepositoryImpl(localDataSource: Get.find()),
    );

    // years usecase
    Get.lazyPut(() => GetYearsUsecase(historyRepository: Get.find()));
    Get.lazyPut(() => GetYearsController(getYearsUsecase: Get.find()));

    // total usecase
    Get.lazyPut(
      () => GetTotalUsecase(historyRepository: Get.find<HistoryRepository>()),
    );
    Get.lazyPut(() => GetTotalController(getTotalUsecase: Get.find()));

    // histories data usecase
    Get.lazyPut(
      () =>
          GetHistoriesUsecase(historyRepository: Get.find<HistoryRepository>()),
    );
    Get.lazyPut(() => HistoriesDataController(getHistoriesUsecase: Get.find()));
  }
}
