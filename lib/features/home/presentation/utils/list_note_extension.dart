import 'package:fin_sight/shared/domain/entities/note.dart';

extension ListNoteExtension on List<Note> {
  double get calculateAmount {
    return fold(0.0, (prevValue, element) => prevValue + element.amount);
  }
}
