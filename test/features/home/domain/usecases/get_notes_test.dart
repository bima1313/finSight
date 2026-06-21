import 'package:fin_sight/core/errors/failures.dart';
import 'package:fin_sight/features/home/domain/entities/note.dart';
import 'package:fin_sight/features/home/domain/repositories/note_repository.dart';
import 'package:fin_sight/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements NoteRepository {}

void main() {
  late MockRepository mockRepository;
  late GetNotesUsecase getNotesUsecase;

  setUp(() {
    mockRepository = MockRepository();
    getNotesUsecase = GetNotesUsecase(repository: mockRepository);
  });

  final note = Note(
    title: "testing",
    category: "food",
    amount: 100.0,
    dateTime: DateTime(2018, 9, 7, 18, 25, 30),
  );
  test("Should return a list Note from fetching data", () async {
    when(() => mockRepository.getNotes()).thenAnswer(
      (_) async => Right([
        Note(
          title: "testing",
          category: "food",
          amount: 100.0,
          dateTime: DateTime(2018, 9, 7, 18, 25, 30),
        ),
      ]),
    );

    final data = await getNotesUsecase();

    expect(data.getOrElse((failure) => []), [note]);
    verify(() => mockRepository.getNotes());
  });

  test("Should return a empty list note from fetching data", () async {
    when(() => mockRepository.getNotes()).thenAnswer((_) async => Right([]));

    final data = await getNotesUsecase();

    expect(data.getOrElse((l) => []), []);
    verify(() => mockRepository.getNotes());
  });

  test("Can't connect db", () async {
    when(() => mockRepository.getNotes()).thenAnswer(
      (_) async => Left(DatabaseFailure(message: "can't fetch Data")),
    );

    final data = await getNotesUsecase();

    expect(data, Left(DatabaseFailure(message: "can't fetch Data")));

    verify(() => mockRepository.getNotes());
  });
}
