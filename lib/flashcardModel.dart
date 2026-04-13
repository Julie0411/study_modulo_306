class Flashcard {
  final String front;
  final String back;

  Flashcard({
    required this.front,
    required this.back,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      front: json['front'],
      back: json['back'],
    );
  }
}