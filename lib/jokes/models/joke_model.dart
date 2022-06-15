class JokeModel {
  final int id;
  final bool safe;
  final String? lang;
  final bool error;
  final String category;
  final String type;
  final String? joke;
  final String? setup;
  final String? delivery;
  final Map<String, bool> flags;

  JokeModel({
    required this.id,
    required this.safe,
    required this.lang,
    required this.error,
    required this.category,
    required this.type,
    required this.joke,
    required this.setup,
    required this.delivery,
    required this.flags,
  });

  static JokeModel fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['id'] as int,
      safe: json['safe'] as bool,
      lang: json['lang'] as String?,
      error: json['error'] as bool,
      category: json['category'] as String,
      type: json['type'] as String,
      joke: json['joke'] as String?,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      flags: (json['flags'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as bool)),
    );
  }

  @override
  String toString() {
    return 'JokeModel{id: $id, safe: $safe, lang: $lang, error: $error, category: $category, type: $type, joke: $joke, setup: $setup, delivery: $delivery, flags: $flags}';
  }
}
