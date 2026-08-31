import 'package:fin_sight/features/details/domain/entities/details_notes.dart';

extension ListNoteExtension on List<DetailsNotes> {
  double get calculateAmount {
    return fold(0.0, (prevValue, element) => prevValue + element.amount);
  }
}
