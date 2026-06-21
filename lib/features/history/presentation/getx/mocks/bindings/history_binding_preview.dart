import 'package:fin_sight/features/history/data/mocks/datasource/history_local_data_source_preview.dart';
import 'package:fin_sight/features/history/data/mocks/repositories/history_repository_impl_preview.dart';
import 'package:fin_sight/features/history/domain/repositories/history_repository.dart';
import 'package:fin_sight/features/history/domain/usecases/get_histories.dart';
import 'package:fin_sight/features/history/domain/usecases/get_total.dart';
import 'package:fin_sight/features/history/domain/usecases/get_years.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_total_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_years_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/histories_data_controller.dart';
import 'package:get/get.dart';

class HistoryBindingPreview extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryLocalDataSourcePreview>(
      () => MockHistoryLocalDataSourceImplPreview(),
    );
    Get.lazyPut<HistoryRepository>(
      () => HistoryRepositoryImplPreview(localDataSource: Get.find()),
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
