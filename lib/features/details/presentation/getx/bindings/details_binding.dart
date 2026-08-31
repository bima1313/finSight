import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/features/details/data/datasource/details_notes_local_data_source.dart';
import 'package:fin_sight/features/details/data/repositories/details_notes_repository_impl.dart';
import 'package:fin_sight/features/details/domain/repositories/details_notes_repository.dart';
import 'package:fin_sight/features/details/domain/usecase/get_details_notes_usecase.dart';
import 'package:fin_sight/features/details/presentation/getx/controllers/get_details_notes_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLite());
    Get.lazyPut<DetailsNotesLocalDataSource>(
      () => DetailsNotesLocalDataSourceImpl(dbHelper: Get.find()),
    );
    Get.lazyPut<DetailsNotesRepository>(
      () => DetailsNotesRepositoryImpl(localDataSource: Get.find()),
    );

    Get.lazyPut(() => GetDetailsNotesUsecase(repository: Get.find()));
    Get.lazyPut(
      () => GetDetailsNotesController(getDetailsNotesUsecase: Get.find()),
    );
  }
}
