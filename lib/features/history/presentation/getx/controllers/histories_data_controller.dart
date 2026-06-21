import 'package:fin_sight/features/history/domain/entities/history.dart';
import 'package:fin_sight/features/history/domain/usecases/get_histories.dart';
import 'package:get/get.dart';

class HistoriesDataController extends GetxController
    with StateMixin<List<History>> {
  final GetHistoriesUsecase getHistoriesUsecase;

  HistoriesDataController({required this.getHistoriesUsecase});

  Future<void> getData({required int year}) async {
    change(null, status: .loading());

    final data = await getHistoriesUsecase(year: year);
    data.fold((failure) => change(null, status: .error(failure.message)), (
      data,
    ) {
      if (data.length <= 1) {
        change(null, status: .empty());
      } else {
        change(data, status: .success());
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getData(year: DateTime.now().year);
  }
}
