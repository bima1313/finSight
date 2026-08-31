import 'dart:convert';

import 'package:fin_sight/core/constants/dummy_data.dart';
import 'package:fin_sight/core/errors/exceptions.dart';
import 'package:fin_sight/features/details/data/models/details_notes_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DetailsNotesLocalDataSourcePreview {
  List<DetailsNotesModel> getDetailsNotes({required String dateTime});
}

class DetailsNotesLocalDataSourcePreviewImpl
    implements DetailsNotesLocalDataSourcePreview {
  @override
  List<DetailsNotesModel> getDetailsNotes({required String dateTime}) {
    try {
      final List<Map<String, dynamic>> data = [];
      int index = 0;
      final filteredData = dummyData['data']!.where((item) {
        final String createdAt = item['created_at'] as String;
        return createdAt.startsWith(dateTime);
      }).toList();
      for (Map<String, dynamic> item in filteredData) {
        final itemData = [
          item['title'],
          item['amount'],
          item['category'],
          item['created_at'],
        ];
        final createdAt = item['created_at'] as String;
        final currentDate = createdAt.split(' ')[0];

        if (data.isEmpty || !data[index]['created_at'].contains(currentDate)) {
          data.add({
            "amount": item['amount'],
            "created_at": item['created_at'],
            "notes": [itemData],
          });
          data.length == 1 ? index : index++;
        } else {
          data[index]['amount'] = data[index]['amount'] + item['amount'];
          data[index]['notes'].insert(0, itemData);
        }
      }
      return data.reversed.map((json) {
        final copyData = Map<String, dynamic>.from(json);

        copyData.update('notes', (value) => jsonEncode(value));
        return DetailsNotesModel.fromJson(copyData);
      }).toList();
    } catch (e) {
      throw DatabaseException(message: "can't fetch notes");
    }
  }
}
