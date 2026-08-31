import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/details/presentation/getx/controllers/get_details_notes_controller.dart';
import 'package:fin_sight/features/details/presentation/getx/mocks/bindings/details_binding_preview.dart';
import 'package:fin_sight/features/details/presentation/widgets/card_header.dart';
import 'package:fin_sight/features/details/presentation/widgets/note_list.dart';
import 'package:fin_sight/shared/utils/datetime_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: GetBuilder<GetDetailsNotesController>(
          builder: (controller) => Text(controller.appBarTitle.toUIMonthYear()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 16.0, vertical: 24.0),
          child: const Column(
            spacing: 32.0,
            children: [
              CardHeader(title: 'outflow'),
              NoteList(),
            ],
          ),
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 800),
  name: "Details Screen Preview",
  theme: lightTheme,
)
Widget detailsScreenPreview() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => const DetailsScreen(),
        binding: DetailsBindingPreview(),
      ),
    ],
  );
}
