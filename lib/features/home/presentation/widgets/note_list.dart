import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:fin_sight/features/home/presentation/widgets/note_item.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class NoteList extends GetView<GetNotesController> {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onEmpty: const Center(child: Text("Data is Empty")),
      onLoading: const Center(child: CircularProgressIndicator()),
      onError: (error) => Center(child: Text(error!)),
      (notes) {
        return Column(
          mainAxisSize: .min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.neutral,
                borderRadius: const .all(.circular(16.0)),
              ),
              child: Padding(
                padding: const .all(8.0),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notes!.length < 3 ? notes.length : 3,
                  itemBuilder: (context, index) {
                    final element = notes.elementAt(index);
                    return NoteItem(
                      title: element.title,
                      category: CategoryType.values.byName(element.category),
                      time: element.dateTime,
                      amount: element.amount,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(group: "Home Screen", name: "Note List Widget", theme: lightTheme)
Widget noteListWidgetPreview() {
  return GetMaterialApp(
    getPages: [
      GetPage(
        name: "/",
        page: () => const NoteList(),
        binding: HomeBindingPreview(),
      ),
    ],
  );
}
