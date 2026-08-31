import 'package:fin_sight/features/history/domain/usecases/get_years.dart';
import 'package:get/get.dart';

class GetYearsController extends GetxController {
  final GetYearsUsecase getYearsUsecase;

  GetYearsController({required this.getYearsUsecase});
  List<int> years = [DateTime.now().year];
  final RxInt _selectedYear = DateTime.now().year.obs;
  set setSelectedYear(int value) => _selectedYear.value = value;
  int get selectedYear => _selectedYear.value;

  Future<void> getYears() async {
    final data = await getYearsUsecase();
    data.fold((failure) => years, (data) {
      if (data.isNotEmpty) {
        years = data;
      }
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getYears();
  }
}
