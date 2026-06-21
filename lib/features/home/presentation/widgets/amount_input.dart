import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/home/presentation/utils/currency_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: TextField(
        textAlign: .center,
        cursorColor: AppColors.primary,
        cursorWidth: 2.5,
        keyboardType: .number,
        inputFormatters: [CurrencyInputFormatter()],
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontSize: 45.0,
          color: Colors.black,
          fontWeight: .bold,
        ),
        controller: controller,
        decoration: InputDecoration(
          hint: Center(
            child: Text(
              "0",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 45.0,
                color: Colors.black,
                fontWeight: .bold,
              ),
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Modal Bottom Widget Preview", theme: lightTheme)
Widget modalBottomWidgetPreview() {
  final TextEditingController controller = TextEditingController();
  return Container(
    color: Colors.white,
    child: AmountInput(controller: controller),
  );
}
