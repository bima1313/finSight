import 'package:fin_sight/shared/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/usecase/create_note_usecase.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:get/get.dart';

class CreateNoteController extends GetxController {
  final CreateNoteUsecase createNoteUsecase;
  CreateNoteController({required this.createNoteUsecase});

  final RxBool _isLoading = false.obs;
  final RxString _failureMessage = "".obs;

  bool get isLoading => _isLoading.value;
  String get failureMessage => _failureMessage.value;

  Future<bool> createNote({
    required String title,
    required String amount,
    required String category,
  }) async {
    try {
      final convertAmount = double.parse(amount.replaceAll(".", ""));
      if (title == "" || convertAmount == 0.0) {
        Get.snackbar(
          "Create Note Failed",
          "Title and Amount must be filled",
          duration: Duration(seconds: 2),
          isDismissible: true,
          dismissDirection: .horizontal,
        );
        return false;
      }
      final controller = Get.find<GetNotesController>();
      _isLoading.value = true;
      final note = Note(
        title: title,
        category: category,
        amount: convertAmount,
        dateTime: DateTime.now(),
      );
      final status = await createNoteUsecase(note: note);
      status.fold(
        (failure) {
          _failureMessage.value = failure.message;
        },
        (success) {
          null;
        },
      );
      _isLoading.value = false;
      if (_failureMessage.value != "") {
        Get.snackbar(
          "ERROR",
          _failureMessage.value,
          duration: Duration(seconds: 2),
          isDismissible: true,
          dismissDirection: .horizontal,
        );
      } else {
        await controller.getData();
        Get.back();
      }
      return true;
    } catch (e) {
      Get.snackbar(
        "Create Note Failed",
        "Title and Amount must be filled",
        duration: Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: .horizontal,
      );
      return false;
    }
  }
}
