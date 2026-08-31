extension ListNoteExtension<T> on List<T> {
  double calculateAmount(double Function(T amount) item) {
    return fold(0.0, (prevValue, element) => prevValue + item(element));
  }
}
