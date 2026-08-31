import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/details/domain/entities/details_notes.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class DetailsNotesRepository {
  Future<Either<Failure, List<DetailsNotes>>> getDetailsNotes({
    required String dateTime,
  });
}
