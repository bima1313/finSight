import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor,
  });
  final TextEditingController controller;
  final String hintText;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: .all(.circular(8.0)),
      ),
      child: Padding(
        padding: const .only(left: 8.0),
        child: TextField(
          cursorColor: Colors.black,
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            letterSpacing: 1.0,
          ),
          decoration: InputDecoration(
            icon: Icon(Icons.subject),
            hint: Text(
              hintText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            border: .none,
          ),
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Custom Text Field Widget Preview", theme: lightTheme)
Widget modalBottomWidgetPreview() {
  final TextEditingController controller = TextEditingController();
  return Container(
    color: Colors.white,
    child: CustomTextField(
      controller: controller,
      hintText: "Add a description...",
    ),
  );
}
