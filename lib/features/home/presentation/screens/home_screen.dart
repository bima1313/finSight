import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/getx/mocks/bindings/home_binding_preview.dart';
import 'package:fin_sight/features/home/presentation/widgets/card_header.dart';
import 'package:fin_sight/features/home/presentation/widgets/modal_bottom_widget.dart';
import 'package:fin_sight/features/home/presentation/widgets/note_list.dart';
import 'package:fin_sight/features/home/presentation/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const .all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              const Text("CURRENT SESSION"),
              const TimeWidget(),
              const Padding(
                padding: .symmetric(vertical: 16.0),
                child: CardHeader(title: "Today's Outflow"),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Today's Note",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: .bold,
                    ),
                  ),
                  TextButton(child: const Text("View All"), onPressed: () {}),
                ],
              ),
              const NoteList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.mode_edit),
        label: const Text("New Note"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const ModalBottomWidget();
            },
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(size: Size(360, 800), name: "Home Screen Preview", theme: lightTheme)
Widget homeScreenPreview() {
  return GetMaterialApp(
    theme: AppTheme.lightTheme,
    getPages: [
      GetPage(
        name: "/",
        page: () => const HomeScreen(),
        binding: HomeBindingPreview(),
      ),
    ],
  );
}
