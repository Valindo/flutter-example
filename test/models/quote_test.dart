import 'dart:convert';

import 'package:techm_interview/models/quote.dart';
import 'package:test/test.dart';

void main() {
  test('Quote model should be able to parse json passed to it', () {
    const quoteResponseString =
        "{\"statusCode\":200,\"message\":\"Random quotes\",\"pagination\":{\"currentPage\":1,\"nextPage\":null,\"totalPages\":1},\"totalQuotes\":1,\"data\":[{\"_id\":\"5eb17aadb69dc744b4e715eb\",\"quoteText\":\"Strangely enough, when the Sugababes' 'Freak Like Me' went to number 1, which was built around my 'Are 'Friends' Electric' song, I had another song called 'Rip' go to number 1 in the Kerrang TV chart, so I was pulling new people in from very different areas of musical interest. That was quite an amazing week.\",\"quoteAuthor\":\"Gary Numan\",\"quoteGenre\":\"amazing\",\"__v\":0}]}";
    final quote =
        Quote.fromJson(jsonDecode(quoteResponseString) as Map<String, dynamic>);
    expect(quote.author, "Gary Numan");
    expect(quote.id, "5eb17aadb69dc744b4e715eb");
    expect(quote.quote,
        "Strangely enough, when the Sugababes' 'Freak Like Me' went to number 1, which was built around my 'Are 'Friends' Electric' song, I had another song called 'Rip' go to number 1 in the Kerrang TV chart, so I was pulling new people in from very different areas of musical interest. That was quite an amazing week.");
  });

  test('Quote model should fail incase the json does not match the signature',
      () {
    const quoteResponseString =
        "{\"statusCode\":200,\"message\":\"Random quotes\",\"pagination\":{\"currentPage\":1,\"nextPage\":null,\"totalPages\":1},\"totalQuotes\":1,\"data\":[{\"_id\":\"5eb17aadb69dc744b4e715eb\",\"quoteText\":\"Strangely enough, when the Sugababes' 'Freak Like Me' went to number 1, which was built around my 'Are 'Friends' Electric' song, I had another song called 'Rip' go to number 1 in the Kerrang TV chart, so I was pulling new people in from very different areas of musical interest. That was quite an amazing week.\",\"quoteGenre\":\"amazing\",\"__v\":0}]}";
    try {
      Quote.fromJson(jsonDecode(quoteResponseString) as Map<String, dynamic>);
    } on Exception catch (e) {
      const error = FormatException('Failed to load quote');
      expect(e, error);
    }
    ;
  });
}
