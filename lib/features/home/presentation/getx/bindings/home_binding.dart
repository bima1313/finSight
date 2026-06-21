import 'package:fin_sight/core/databases/sqlite.dart';
import 'package:fin_sight/features/home/data/datasource/note_local_data_source.dart';
import 'package:fin_sight/features/home/data/repositories/note_repository_impl.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fin_sight/features/home/domain/usecase/create_note_usecase.dart';
import 'package:fin_sight/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/create_note_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLite());
    Get.lazyPut<NoteLocalDataSource>(
      () => NoteLocalDataSourceImpl(dbHelper: Get.find()),
    );
    Get.lazyPut<NoteRepository>(
      () => NoteRepositoryImpl(localDataSource: Get.find()),
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
