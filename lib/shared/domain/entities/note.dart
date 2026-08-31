import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String category;
  final double amount;
  final DateTime dateTime;

  const Note({
    required this.title,
    required this.category,
    required this.amount,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [title, category, amount, dateTime];
}
