import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fin_sight/features/home/domain/usecase/create_note_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements NoteRepository {}

void main() {
  late MockRepository mockRepository;
  late CreateNoteUsecase createNoteUsecase;

  setUp(() {
    mockRepository = MockRepository();
    createNoteUsecase = CreateNoteUsecase(repository: mockRepository);
  });

  final note = Note(
    title: "2 apple",
    category: "snack",
    amount: 240.50,
    dateTime: DateTime.now(),
  );
  test("Create note success", () async {
    when(
      () => mockRepository.createNote(note: note),
    ).thenAnswer((_) async => Right(null));

    final createNote = await createNoteUsecase(note: note);

    expect(createNote, Right(null));
  });

  test("Create note failed", () async {
    when(() => mockRepository.createNote(note: note)).thenAnswer(
      (_) async => Left(DatabaseFailure(message: "can't save note")),
    );
    final createNote = await createNoteUsecase(note: note);

    expect(createNote, Left(DatabaseFailure(message: "can't save note")));
  });
}
