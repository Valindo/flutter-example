class Quote {
  final String id;
  final String quote;
  final String author;
  var rating = 0;
  Quote({required this.id, required this.quote, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '_id': String id,
        'content': String quote,
        'author': String author,
      } =>
        Quote(id: id, quote: quote, author: author),
      {
        'data': [
          {
            '_id': String id,
            'quoteText': String quote,
            'quoteAuthor': String author,
          }
        ]
      } =>
        Quote(id: id, quote: quote, author: author),
      _ => throw const FormatException('Failed to load quote'),
    };
  }

  rateQuote(int rating) {
    this.rating = rating;
  }
}
