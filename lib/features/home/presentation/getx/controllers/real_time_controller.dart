import 'dart:async';

import 'package:fin_sight/shared/utils/datetime_parser.dart';
import 'package:get/get.dart';

class RealTimeController extends GetxController {
  Timer? _timer;
  String currentDate = DateTime.now().toDate();
  String currentTime = DateTime.now().toHour();

  @override
  void onInit() {
    _timer = .periodic(const Duration(seconds: 1), (_) {
      currentDate = DateTime.now().toDate();
      currentTime = DateTime.now().toHour();
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
