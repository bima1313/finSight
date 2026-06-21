import 'package:fin_sight/features/history/presentation/getx/controllers/get_total_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_years_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/histories_data_controller.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void navigationClick({required int selectedIndex}) {
    final totalController = Get.find<GetTotalController>();
    final yearsController = Get.find<GetYearsController>();
    final historiesController = Get.find<HistoriesDataController>();
    currentIndex = selectedIndex;
    update();

    yearsController.getYears();
    totalController.getTotal(year: DateTime.now().year);
    historiesController.getData(year: DateTime.now().year);
  }
}
