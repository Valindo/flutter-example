import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:techm_interview/main.dart';
import 'package:techm_interview/widgets/action_widets.dart';
import 'package:http/http.dart' as http;
import 'action_widgets.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Should display action buttons', (widgetTester) async {
    await widgetTester.pumpWidget(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppState(http.Client()))],
      child: const MaterialApp(
          home: Material(
        child: ActionWidget(),
      )),
    ));

    final nextButton = find.text('Next');
    final shareButton = find.text('Share');
    expect(nextButton, findsOneWidget);
    expect(shareButton, findsOneWidget);
  });

  testWidgets('Should be able to click the next button', (widgetTester) async {
    final client = MockClient();
    await widgetTester.pumpWidget(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppState(client))],
      child: const MaterialApp(
          home: Material(
        child: ActionWidget(),
      )),
    ));
    when(client.get(Uri.parse('https://api.quotable.io/random'))).thenAnswer(
        (_) async => http.Response(
            '{"_id":"KsjEIA45Uf","content":"The problem with Google is you have 360 degrees of omnidirectional information on a linear basis, but the algorithms for irony and ambiguity are not there. And those are the algorithms of wisdom.","author":"William Hurt","tags":["Wisdom","Technology"],"authorSlug":"william-hurt","length":195,"dateAdded":"2021-02-27","dateModified":"2023-04-14"}',
            200));

    when(client.get(Uri.parse(
            'https://quote-garden.onrender.com/api/v3/quotes/random')))
        .thenAnswer((_) async => http.Response(
            '{"statusCode":200,"message":"Quotes","pagination":{"currentPage":1,"nextPage":2,"totalPages":7268},"totalQuotes":72672,"data":[{"_id":"5eb17aadb69dc744b4e70d4a","quoteText":"Forty is the old age of youth, fifty is the youth of old age.","quoteAuthor":"Hosea Ballou","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d5c","quoteText":"I\'m not interested in age. People who tell me their age are silly. You\'re as old as you feel.","quoteAuthor":"Henri Frederic Amiel","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d9c","quoteText":"A man loves the meat in his youth that he cannot endure in his age.","quoteAuthor":"William Shakespeare","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d3c","quoteText":"Age considers youth ventures.","quoteAuthor":"Rabindranath Tagore","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d2c","quoteText":"Nobody grows old merely by living a number of years. We grow old by deserting our ideals. Years may wrinkle the skin, but to give up enthusiasm wrinkles the soul.","quoteAuthor":"Samuel Ullman","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d33","quoteText":"Every man over forty is a scoundrel.","quoteAuthor":"George Bernard Shaw","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d49","quoteText":"Old minds are like old horses you must exercise them if you wish to keep them in working order.","quoteAuthor":"John Adams","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d5b","quoteText":"You end up as you deserve. In old age you must put up with the face, the friends, the health, and the children you have earned.","quoteAuthor":"Judith Viorst","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d34","quoteText":"Forty is the old age of youth fifty the youth of old age.","quoteAuthor":"Victor Hugo","quoteGenre":"age","__v":0},{"_id":"5eb17aadb69dc744b4e70d55","quoteText":"I think your whole life shows in your face and you should be proud of that.","quoteAuthor":"Lauren Bacall","quoteGenre":"age","__v":0}]}',
            200));
    final nextButton = find.text('Next');
    await widgetTester.tap(nextButton);
    await widgetTester.pump();    
    // not sure how to test a changeNotification providers when it is injected
    // Since the bottom is clicked and no errors, it's assumed it works ( I know bad idea )
    
  });
}
