import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:techm_interview/models/quote.dart';

Future<Quote> getRandomQuote(http.Client client) async {
  final request1 = client.get(Uri.parse('https://api.quotable.io/random'));
  final request2 = client.get(Uri.parse('https://quote-garden.onrender.com/api/v3/quotes/random'));
  final response = await Future.any([request1, request2]);
  if (response.statusCode == 200 ){
    return Quote.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load quote');
  }
}


void main() async{
  final value = await getRandomQuote(http.Client());
  print(value.quote);
}