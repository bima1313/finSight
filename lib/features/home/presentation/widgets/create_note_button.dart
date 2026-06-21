import 'package:fin_sight/features/home/presentation/getx/controllers/category_selected_controller.dart';
import 'package:fin_sight/features/home/presentation/getx/controllers/create_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNoteButton extends GetView<CreateNoteController> {
  const CreateNoteButton({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: Size(double.infinity, 50.0)),
        onPressed: () async {
          final categorySelectedController =
              Get.find<CategorySelectedController>();
          final categoryName = categorySelectedController.categoryName;
          await controller.createNote(
            title: title,
            amount: amount,
            category: categoryName.name,
          );
        },
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.blue))
            : const Row(
                spacing: 8.0,
                mainAxisAlignment: .center,
                children: [Text("Save Entry"), Icon(Icons.check)],
              ),
      );
    });
  }
}
