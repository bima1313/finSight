import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_total_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/get_years_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/controllers/histories_data_controller.dart';
import 'package:fin_sight/features/history/presentation/getx/mocks/bindings/history_binding_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetYearsController>(
      builder: (controller) {
        return DropdownMenu(
          textAlign: .center,
          textStyle: TextStyle(
            fontSize: 14.0,
            color: AppColors.primary,
            fontWeight: .bold,
          ),
          initialSelection: controller.years.last,
          selectOnly: true,
          inputDecorationTheme: InputDecorationTheme(
            isCollapsed: true,
            filled: true,
            border: OutlineInputBorder(
              borderSide: .none,
              borderRadius: .all(.circular(32.0)),
            ),
            fillColor: const Color.fromARGB(120, 210, 212, 216),
          ),
          menuStyle: MenuStyle(
            shape: .all(
              const RoundedRectangleBorder(borderRadius: .all(.circular(16.0))),
            ),
            visualDensity: VisualDensity.standard,
          ),
          dropdownMenuEntries: controller.years.map<DropdownMenuEntry>((item) {
            return DropdownMenuEntry(
              value: item,
              label: item.toString(),
              style: ButtonStyle(
                foregroundColor: .all(AppColors.primary),
                textStyle: .all(TextStyle(fontWeight: .bold)),
              ),
            );
          }).toList(),
          onSelected: (value) {
            final controller = Get.find<HistoriesDataController>();
            final totalController = Get.find<GetTotalController>();
            controller.getData(year: value);
            totalController.getTotal(year: value);
          },
        );
      },
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 400),
  name: "custom Dropdown Menu Preview",
  theme: lightTheme,
)
Widget customDropdownMenu() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(alignment: .topCenter, child: CustomDropdownMenu()),
          ),
        ),
        binding: HistoryBindingPreview(),
      ),
    ],
  );
}
