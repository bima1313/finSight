import 'package:fin_sight/shared/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:fin_sight/features/home/presentation/utils/list_note_extension.dart';
import 'package:get/get.dart';

class GetNotesController extends GetxController with StateMixin<List<Note>> {
  final GetNotesUsecase getNotesUsecase;
  GetNotesController({required this.getNotesUsecase});
  final RxDouble _totalAmount = 0.0.obs;
  double get totalAmount => _totalAmount.value;

  Future<void> getData() async {
    change(null, status: .loading());
    final data = await getNotesUsecase();
    data.fold(
      (failure) {
        change(null, status: .error(failure.message));
      },
      (data) {
        if (data.isEmpty) {
          change(null, status: .empty());
        } else {
          _totalAmount.value = data.calculateAmount;
          change(data, status: .success());
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
