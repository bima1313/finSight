import 'package:fin_sight/features/home/data/mocks/datasource/note_local_data_source_preview.dart';
import 'package:fin_sight/features/home/data/mocks/repositories/note_repository_impl_preview.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fin_sight/features/home/domain/usecase/create_note_usecase.dart';
import 'package:fin_sight/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/create_note_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:get/get.dart';

class HomeBindingPreview extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteLocalDataSourcePreview>(
      () => MockNoteLocalDataSourceImplPreview(),
    );
    Get.lazyPut<NoteRepository>(
      () => NoteRepositoryImplPreview(localDataSource: Get.find()),
    );

    // get notes usecase
    Get.lazyPut(() => GetNotesUsecase(repository: Get.find()));
    Get.lazyPut(() => GetNotesController(getNotesUsecase: Get.find()));

    // create note usecase
    Get.lazyPut(
      () => CreateNoteUsecase(repository: Get.find<NoteRepository>()),
    );
    Get.lazyPut(() => CreateNoteController(createNoteUsecase: Get.find()));

    Get.lazyPut(() => RealTimeController());
  }
}
