import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:get/get.dart';

class CategorySelectedController extends GetxController {
  CategoryType categoryName = CategoryType.dining;

  void setCategory({required CategoryType name}) {
    categoryName = name;
    update();
  }
}
