import 'package:fin_sight/features/details/domain/entities/details_notes.dart';
import 'package:fin_sight/features/details/domain/usecase/get_details_notes_usecase.dart';
import 'package:fin_sight/features/details/presentation/utils/list_note_extension.dart';
import 'package:fin_sight/shared/utils/datetime_parser.dart';
import 'package:get/get.dart';

class GetDetailsNotesController extends GetxController
    with StateMixin<List<DetailsNotes>> {
  late final DateTime appBarTitle;
  final GetDetailsNotesUsecase getDetailsNotesUsecase;

  GetDetailsNotesController({required this.getDetailsNotesUsecase});
  final RxDouble _totalAmount = 0.0.obs;
  double get totalAmount => _totalAmount.value;

  Future<void> getData({required String datetime}) async {
    change(null, status: .loading());
    final data = await getDetailsNotesUsecase(dateTime: datetime);
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
    appBarTitle = Get.arguments as DateTime? ?? DateTime.now();
    getData(datetime: appBarTitle.toDBMonthYear());
  }
}
