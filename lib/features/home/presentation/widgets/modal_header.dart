import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          "New Entry",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: .bold,
          ),
        ),
        IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
      ],
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Modal Header Widget", theme: lightTheme)
Widget modalHeaderWidget() => Container(
  color: Colors.white,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: const ModalHeader(),
  ),
);
