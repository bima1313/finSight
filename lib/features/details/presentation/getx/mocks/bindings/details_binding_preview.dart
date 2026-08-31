import 'package:fin_sight/features/details/data/mocks/datasource/details_notes_local_data_source_preview.dart';
import 'package:fin_sight/features/details/data/mocks/repositories/details_notes_repository_impl_preview.dart';
import 'package:fin_sight/features/details/domain/repositories/details_notes_repository.dart';
import 'package:fin_sight/features/details/domain/usecase/get_details_notes_usecase.dart';
import 'package:fin_sight/features/details/presentation/getx/controllers/get_details_notes_controller.dart';
import 'package:get/get.dart';

class DetailsBindingPreview extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsNotesLocalDataSourcePreview>(
      () => DetailsNotesLocalDataSourcePreviewImpl(),
    );
    Get.lazyPut<DetailsNotesRepository>(
      () => DetailsNotesRepositoryImplPreview(localDataSource: Get.find()),
    );

    Get.lazyPut(() => GetDetailsNotesUsecase(repository: Get.find()));
    Get.lazyPut(
      () => GetDetailsNotesController(getDetailsNotesUsecase: Get.find()),
    );
  }
}
