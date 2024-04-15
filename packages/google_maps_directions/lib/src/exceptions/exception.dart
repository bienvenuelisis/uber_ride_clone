///Custom class for exceptions.
class DirectionsException implements Exception {
  DirectionsException({
    required this.status,
    required this.message,
    this.description,
  });

  final String? description;
  final String message;
  final String status;
}
