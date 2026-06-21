import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/category_selected_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:fin_sight/features/home/presentation/widgets/amount_input.dart';
import 'package:fin_sight/features/home/presentation/widgets/category_item.dart';
import 'package:fin_sight/features/home/presentation/widgets/create_note_button.dart';
import 'package:fin_sight/features/home/presentation/widgets/custom_radio_category.dart';
import 'package:fin_sight/features/home/presentation/widgets/custom_text_field.dart';
import 'package:fin_sight/features/home/presentation/widgets/modal_header.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class ModalBottomWidget extends StatefulWidget {
  const ModalBottomWidget({super.key});

  @override
  State<ModalBottomWidget> createState() => _ModalBottomWidgetState();
}

class _ModalBottomWidgetState extends State<ModalBottomWidget> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final controller = Get.put(CategorySelectedController());
  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final categoryName = controller.categoryName;
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.windChime,
        borderRadius: const .directional(
          topStart: .circular(32.0),
          topEnd: .circular(32.0),
        ),
      ),
      child: Padding(
        padding: const .all(32.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            const ModalHeader(),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 198, 198),
                borderRadius: .all(.circular(16.0)),
              ),
              child: Padding(
                padding: const .all(32.0),
                child: Stack(
                  alignment: .centerStart,
                  children: [
                    AmountInput(controller: _amountController),
                    Container(
                      color: const Color.fromARGB(255, 199, 198, 198),
                      child: Padding(
                        padding: const .symmetric(vertical: 14.0),
                        child: Text(
                          "Rp",
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: .bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "note".toUpperCase(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: .w600),
            ),
            CustomTextField(
              controller: _noteController,
              hintText: "Add a description...",
            ),
            Text(
              "category".toUpperCase(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: .w600),
            ),
            Center(
              child: CustomRadioCategory(
                onChanged: (value) {
                  controller.setCategory(name: value);
                },
                size: 80,
                items: CategoryType.values.map((category) {
                  return CategoryItem(value: category);
                }).toList(),
              ),
            ),
            CreateNoteButton(
              title: _noteController.text,
              amount: _amountController.text,
            ),
          ],
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 800),
  name: "Modal Bottom Widget Preview",
  theme: lightTheme,
)
Widget modalBottomWidgetPreview() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => const ModalBottomWidget(),
        binding: HomeBindingPreview(),
      ),
    ],
  );
}
