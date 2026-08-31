import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/details/presentation/getx/controllers/get_details_notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CardHeader extends GetView<GetDetailsNotesController> {
  const CardHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 0,
      locale: "id_ID",
      symbol: "Rp.",
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: .all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8.0,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(letterSpacing: 1.0),
              ),
              GetBuilder<GetDetailsNotesController>(
                builder: (controller) {
                  return Text(
                    currency.format(controller.totalAmount),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      letterSpacing: 1.0,
                      fontWeight: .bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Card Header Widget", theme: lightTheme)
Widget previewCardHeaderWidget() => const CardHeader(title: "Today's Outflow");
