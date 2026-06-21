import 'package:fin_sight/features/history/domain/usecases/get_total.dart';
import 'package:get/get.dart';

class GetTotalController extends GetxController {
  final GetTotalUsecase getTotalUsecase;
  GetTotalController({required this.getTotalUsecase});
  final RxDouble _total = 0.0.obs;
  double get total => _total.value;

  Future<void> getTotal({required int year}) async {
    final data = await getTotalUsecase(year: year);
    data.fold((failure) => null, (data) => _total.value = data);
  }

  @override
  void onInit() {
    super.onInit();
    getTotal(year: DateTime.now().year);
  }
}
