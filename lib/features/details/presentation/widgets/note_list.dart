import 'package:fin_sight/core/themes/app_colors.dart';
import 'package:fin_sight/core/themes/app_theme.dart';
import 'package:fin_sight/features/details/presentation/getx/controllers/get_details_notes_controller.dart';
import 'package:fin_sight/shared/domain/entities/category_type.dart';
import 'package:fin_sight/shared/presentation/widgets/note_item.dart';
import 'package:fin_sight/shared/utils/datetime_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class NoteList extends GetView<GetDetailsNotesController> {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onEmpty: const Center(child: Text("Data is Empty")),
      onLoading: const Center(child: CircularProgressIndicator()),
      onError: (error) => Center(child: Text(error!)),
      (state) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state!.length,
          itemBuilder: (context, index) {
            final data = state.elementAt(index);
            return Padding(
              padding: const .only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 16.0,
                children: [
                  Text(data.datetime.toDate()),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.slateGrey,
                      borderRadius: const .all(.circular(16.0)),
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.notes.length,
                      itemBuilder: (context, index) {
                        final note = data.notes.elementAt(index);
                        return NoteItem(
                          title: note.title,
                          category: CategoryType.values.byName(note.category),
                          time: note.dateTime,
                          amount: note.amount,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    // return ListView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 3,
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const .only(bottom: 32.0),
    //       child: Column(
    //         crossAxisAlignment: .start,
    //         spacing: 16.0,
    //         children: [
    //           Text('September 28, Thursday'),
    //           Container(
    //             width: MediaQuery.of(context).size.width,
    //             decoration: BoxDecoration(
    //               color: AppColors.slateGrey,
    //               borderRadius: const .all(.circular(16.0)),
    //             ),
    //             child: ListView.builder(
    //               physics: NeverScrollableScrollPhysics(),
    //               shrinkWrap: true,
    //               itemCount: 2,
    //               itemBuilder: (context, index) {
    //                 return NoteItem(
    //                   title: 'title',
    //                   category: CategoryType.dining,
    //                   time: DateTime.now(),
    //                   amount: 123,
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Note List Widget", theme: lightTheme)
Widget previewCardHeaderWidget() => const Scaffold(
  body: Padding(padding: EdgeInsets.all(8.0), child: NoteList()),
);
