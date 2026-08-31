import 'package:equatable/equatable.dart';
import 'package:fin_sight/shared/domain/entities/note.dart';

class DetailsNotes extends Equatable {
  final double amount;
  final DateTime datetime;
  final List<Note> notes;

  const DetailsNotes({
    required this.amount,
    required this.datetime,
    required this.notes,
  });

  @override
  List<Object?> get props => [amount, datetime, notes];
}
